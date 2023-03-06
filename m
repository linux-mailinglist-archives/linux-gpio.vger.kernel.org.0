Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 978FF6AB9AC
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 10:23:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbjCFJXr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 04:23:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbjCFJXo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 04:23:44 -0500
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79A842739
        for <linux-gpio@vger.kernel.org>; Mon,  6 Mar 2023 01:23:42 -0800 (PST)
Received: by mail-ua1-x92d.google.com with SMTP id x40so5956142uaf.2
        for <linux-gpio@vger.kernel.org>; Mon, 06 Mar 2023 01:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678094621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WmGxT0R5eR6v2aBCU3TSlvNxSxXuWeZonOf78HDRp4=;
        b=8D9OdtC0F3+qBtaRxlHN5TzQD7LjvXLkrOb8yKPcyBoovFP8tpDM+IVRgfF+6qHvtM
         k+eFUsPiNabWwFNVL9TSHbwFue5eoLFhJLLScOCUqanj8PPN4i93JewoBBGBST7N550t
         u4fItJsgo/GFJadt7wzYP5sEfR9z0i8i6h1bddExu6Z6vQJZFbnmQMvFujcsnYTg8VJ4
         tRtDFRWGZQVCnXS2hna4JeeWob2M/wv47h+IF8K8c0IzXP0P25FKJL+UCQWDejjhMMZ+
         E+BcIHAKmRsKqjx8N1TygfqKiOazvn8sKSK6Wi14/6rBKGm14+I87FbBZURmITdnY6lh
         athQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678094621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5WmGxT0R5eR6v2aBCU3TSlvNxSxXuWeZonOf78HDRp4=;
        b=OX1lQIbKZmC/VuueCbpzG1mI3iQZDYkSag9aW0sGmPOFEZPGnHAGwHJXhh8O9O3ohb
         51IrS+DQDfXw/RZwPkCxuNFCn3Jr4b4oL/jKD7s+ANGcN1BPL1LK4rYUd/cgCPs/T3QI
         GNfeghb29+t5mXyLrGE98wNnUouQVeITqgNu0qOCgpeq5B/2Gdh+1Y/jwIbOb/Tx/lkW
         VaozRwx6OnksQJeY+mdMZhHm1bYs+qe8kUDKXiy2CFEbRm2cpgH1flsifIRvMcZIWqhX
         p4yBFcpxCJCApyDMUp3SJ+jmK8RS78JuclIjJIWLFd4hqoB3yKn/OOlEbYUOfFc97QTN
         nLxA==
X-Gm-Message-State: AO0yUKW+D5AJpatrFUUthQceTh3nx0R5ZGbW2m/DpsxJFxl3GfBo0THd
        Tj382Oejk9H2BgWFs3tFPw7UfdcxnYiLks/7ENIr6g==
X-Google-Smtp-Source: AK7set8oYDvhH0jruOqfFFa3967LzAHy0bKz/fypuAmQi3CfC0FCoHeoohwCVjB1fMyL2eyMANPOK7bSZOz33o8mPgk=
X-Received: by 2002:a1f:914a:0:b0:401:4007:10c4 with SMTP id
 t71-20020a1f914a000000b00401400710c4mr6472309vkd.1.1678094621540; Mon, 06 Mar
 2023 01:23:41 -0800 (PST)
MIME-Version: 1.0
References: <20230228081724.94786-1-william.gray@linaro.org>
In-Reply-To: <20230228081724.94786-1-william.gray@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 6 Mar 2023 10:23:30 +0100
Message-ID: <CAMRc=MfD3=ifo9EJf=5_HZKLXnbASi=ehYm=Zs4WQA+YxfffQw@mail.gmail.com>
Subject: Re: [RESEND] gpio: ws16c48: Fix off-by-one error in WS16C48 resource
 region extent
To:     William Breathitt Gray <william.gray@linaro.org>
Cc:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, techsupport@winsystems.com,
        stable@vger.kernel.org,
        Paul Demetrotion <pdemetrotion@winsystems.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 2, 2023 at 11:30=E2=80=AFPM William Breathitt Gray
<william.gray@linaro.org> wrote:
>
> The WinSystems WS16C48 I/O address region spans offsets 0x0 through 0xA,
> which is a total of 11 bytes. Fix the WS16C48_EXTENT define to the
> correct value of 11 so that access to necessary device registers is
> properly requested in the ws16c48_probe() callback by the
> devm_request_region() function call.
>
> Fixes: 2c05a0f29f41 ("gpio: ws16c48: Implement and utilize register struc=
tures")
> Cc: stable@vger.kernel.org
> Cc: Paul Demetrotion <pdemetrotion@winsystems.com>
> Signed-off-by: William Breathitt Gray <william.gray@linaro.org>
> ---

Why did you need to resend this? Anything changed?

Bart
