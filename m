Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC0E877F0CB
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Aug 2023 09:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348333AbjHQHAs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Aug 2023 03:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348343AbjHQHAa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Aug 2023 03:00:30 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59E1B1FD0
        for <linux-gpio@vger.kernel.org>; Thu, 17 Aug 2023 00:00:28 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-cfcebc33d04so6897415276.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Aug 2023 00:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692255627; x=1692860427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hr/xLuRqHPiIp7tvo55AtM5IbQFVYhSzAqbDSIpKDYQ=;
        b=E0aIGzws7LZnOQoMDIQLZ5QQCvwK3FIktoBLHnRyargWuUNjpbXKtSPYb07sIMv8cC
         GffDGGFgQUn+C9SidEWqAkqEtKIKWluKX00Bgl/pVhWjxRxNy2Tma1x4gNAtqfpUaoV0
         jZzMwpQG9049n2/8xzs92awHZRPpTLMqZ1yyn1yCCowLj5e+IkKsQrLRyRZhbVwk/7z5
         6fhUkccil7QxApuBpEKZzGTmyCil2BKjUsbKAh3VYpWvISuSDijkQX/tFI9bxgWDvk22
         bn56iwM2O6LUL4AFib+GRk4TO73PF805B3fYvI2tPz9GZpMWIxg0YKVbOMzPxOuxXuPW
         +yyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692255627; x=1692860427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hr/xLuRqHPiIp7tvo55AtM5IbQFVYhSzAqbDSIpKDYQ=;
        b=XSN5AbfFqIHXL+pdARYSBdjuQmPtRGtqywY2GaN7JR2Tjggbnc5hTwlJiyDS/R/hGL
         7p1yP7X5jRXtbU7a6hnJzO4Xf9JHrtOyTrujq0+RPwhIA/pH10ImnP0sp7FwB7T5yjCE
         HRgyLJ1winNZ1M8fgtzSKj4/YYHkU8wz5vxcV1cungA13i3cakjPxKdCij+JV7sfmUx1
         o7Uq7CINL75cczL+psVbWP3QAgMAv1tY7qewTZQeEGL6npxFh/2rFYzVfNwQUXYke0Oz
         9Hg2zcVBUix6JKjQPb+Vgtn3YtqE9FWA9W+grQ3EZO+YcRmudkcedPyOXOA/kXjgmsE2
         pLQA==
X-Gm-Message-State: AOJu0YzYkIsvrJCA4Q25ZdTpGcq5mX6lXbw1WU/9opGWI6QtjTNs6xXv
        BP/eEceGgqooE4Kfw8Vo8Lr69W4tmmzWBc4A7IN55w==
X-Google-Smtp-Source: AGHT+IFA7jqQ3lKHYZ3TPhUsP6rkndiWbfY2uwFAshtkh2s4HzLjAg6woMvQ1l73WBWdTHuAIZfkrok2wV75tpUlxzQ=
X-Received: by 2002:a25:dc87:0:b0:d62:a199:fb18 with SMTP id
 y129-20020a25dc87000000b00d62a199fb18mr4535478ybe.60.1692255627601; Thu, 17
 Aug 2023 00:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230816122032.15548-1-brgl@bgdev.pl> <CACRpkdaTUi0r+nY12J8sLxmvfG2xRd+OMngcMiQkr5cqerevtA@mail.gmail.com>
 <ZN2k7gemanIpbyFh@sol>
In-Reply-To: <ZN2k7gemanIpbyFh@sol>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 17 Aug 2023 09:00:16 +0200
Message-ID: <CACRpkdaTn+Hj6_tiS1GGvwfcyeH5UGD6Q0K0pDpaV1Dk+WVRvA@mail.gmail.com>
Subject: Re: [PATCH 0/5] gpio: cdev: bail out of poll() if the device goes down
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 17, 2023 at 6:41=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:

> My preference would be for a separate nb for the chip removal to keep
> those two classes of events distinct.

That's a good point. Bart do you think you can rework it as such?

Yours,
Linus Walleij
