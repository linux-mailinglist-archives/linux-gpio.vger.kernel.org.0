Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2BEC572F77
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Jul 2022 09:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234227AbiGMHps (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Jul 2022 03:45:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233074AbiGMHpr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Jul 2022 03:45:47 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3FA7E5877
        for <linux-gpio@vger.kernel.org>; Wed, 13 Jul 2022 00:45:46 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id y4so13010070edc.4
        for <linux-gpio@vger.kernel.org>; Wed, 13 Jul 2022 00:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c8X4Vu2ZWa6I2Um12C1RT93BfuiOm6mADzjzffETS0E=;
        b=KsEYsT+mc+QR6aljberUmrYNjYdRnlNPdInbbYEHyF0SUBEYYJZiiFBo38+/qD7e+A
         mUIoacQruGvCNM6scS9Awws4l0XCcIWlS4vbFGxbMRWUSel5AtB+UqHa1rBlZXbSKsTa
         /wy0+4/VrxgHxQ004IEEBYs4NNlVBhnc/v9QF7hFmDCZrGEdV9whwd8BTAiMu+BGy3AR
         8sDGmY18C87/toTAMqtZubTaOKwJlWV1i9I1qpY21FH3vvui3Wg+AFfTf96OWLNKqkYF
         Ylcv83c1gIYjMoQGmVzIbkdL7ekQTbfrPxOmsXWPN3bSuomauma/S+G26KuNFFKblUfr
         xaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c8X4Vu2ZWa6I2Um12C1RT93BfuiOm6mADzjzffETS0E=;
        b=xbiIZq5bso9q6zqUB+K7GyARB1pFfBkUMdyAt4Vqmirlrp/eo00TqhqDJQ1ahMeck2
         weuNBObqKlBM0H4mp9ycsOsc5mnmVKj49Csx5H2sBeoWQ4Ag8cSU9BonDWaq26ZktLLZ
         z3cMPPUbr2bCONTKNsgVvhnnRTcQkGVaa5hHBkzL5UzFoLjkp6VwZzDRgT67Pbwh8JDe
         zs8LD0IhasgWkZNtdbrGYfpD7MfUVU1H0Mt/esdXMhUtnVgMa8k3m6oNFHS+f3tQq4jy
         QKvI8H3wvYb41IWcBSNBfAaHcDW3hFfA1otocDWlEH8cIwgBXFCbXpeJxjbbsBHASPgZ
         mkFQ==
X-Gm-Message-State: AJIora/MOPkQ7YBuIyAdPHPaG3lUlFHKhU6W8L89v4B36sV58jxissC3
        3xwRhNeoEj0qA6lO88SJB0mUwEgn+GcZOw3Fv0Yiig==
X-Google-Smtp-Source: AGRyM1uK+GJnmRQSEDTIyrpUeGU/Je76t9/u0s4eyZnuvDVk5Z9WnGH2ApQW6J0G9aY+2+WekuhSQFSXVyw4AwzafRQ=
X-Received: by 2002:a05:6402:4c3:b0:43a:f612:179d with SMTP id
 n3-20020a05640204c300b0043af612179dmr3066980edw.422.1657698345414; Wed, 13
 Jul 2022 00:45:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220711141753.32523-1-aakashsensharma@gmail.com>
In-Reply-To: <20220711141753.32523-1-aakashsensharma@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 13 Jul 2022 09:45:34 +0200
Message-ID: <CAMRc=Md2pUk0FuVfYDxP602vfUR+BWLLiNtpwzOP1uHz5SYxYA@mail.gmail.com>
Subject: Re: [PATCH] gpio: 104-idi-48: unsigned to unsigned int cleanup
To:     Aakash Sen Sharma <aakashsensharma@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 11, 2022 at 4:18 PM Aakash Sen Sharma
<aakashsensharma@gmail.com> wrote:
>
> * Removing checkpatch warnings.
> * No functional changes.
>
> Signed-off-by: Aakash Sen Sharma <aakashsensharma@gmail.com>
> ---

Applied, thanks!

Bart
