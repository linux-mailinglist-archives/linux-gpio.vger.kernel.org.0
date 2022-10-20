Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C817D60590C
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Oct 2022 09:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbiJTHxT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Oct 2022 03:53:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbiJTHxQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Oct 2022 03:53:16 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E11311A953
        for <linux-gpio@vger.kernel.org>; Thu, 20 Oct 2022 00:53:11 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id l22so28678665edj.5
        for <linux-gpio@vger.kernel.org>; Thu, 20 Oct 2022 00:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bm0vkM5wr/+4Mm+pAGk2CVcFWiT+KtN810ewhbWr3To=;
        b=k1F6m8aKrE0u5jIHlQvKNPLuWT7u5rAEc9STRhQZuGg/PpVEKyeE4MRPuXsKE+CRpH
         IVLO2FMM48bx4NY8Vz/KT/lf3Zo6mQVnM1hd2nUgENUb0fNFZ+aCm235DXe35t+WQ3hf
         KvcrsvmyVcRibgPbXoJyiEwnw89TKA9S4PcDDiBZEra1EnV/962+giTTY2sDh3gdlQxa
         mzk1mywj0VMVTWPi1QrjU8XF57xZbiNznVNepBFyEd7q7K68KPHrqFGzfPjolIW9x4qn
         rUtAt9Dp7vEje60e0vgmUKe5T5D16IFxEaxiYh1ZlO9KsT9zNQNkQuRmKfvf5FPxc2bL
         BdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bm0vkM5wr/+4Mm+pAGk2CVcFWiT+KtN810ewhbWr3To=;
        b=4bhFbMflHvP5AmJptPkclbHC/+Kbz0yy9y30KrqbfOhx1aBxzL+l0gO2L2j+Y/eRD5
         HLclIio4rZlQiPwve3ZeZ0f2rL3nsdS4u2KlSixPmwTOofcBSlcR2aHbF2JAtFYj6M4I
         zZ4cWJgjiKrLA1/2ERGouLn//Ue1ZN4W0HKYXkiLOpR2ovKLF//70GzEQ5XUrpvUiWIl
         cGTLhS0aR6dxcuPEwLy7wrtyGoyupmccOo2LqtNsdi0l/eAHYaSvwItMADtbhN4f+mAE
         aP8pxQL5VJljE5/ZTQX4GMq2JheTXzMotDPXD/hkSXy5ZiuYppS+EKK+3F3ZP8z3Ij+1
         Weng==
X-Gm-Message-State: ACrzQf0PkQJ6+FYCmySzvXXKR6C3FrgB0NtNytgN7X5n7TyYhqpeG6R0
        KLmLWrwD4gdLeiB3YYIPVCbUvmwFceSc+efegXG0LQ==
X-Google-Smtp-Source: AMsMyM7iQ6iIBDDVAXsPhM8E+fezmoZGOwJ6Ju/JfiEYC8PUXsNKfHAhSd2QOln4f84lV6Rlp8g3QqkYDLF9qMQzxMI=
X-Received: by 2002:a05:6402:4029:b0:45b:d50c:b9b0 with SMTP id
 d41-20020a056402402900b0045bd50cb9b0mr10931422eda.126.1666252389406; Thu, 20
 Oct 2022 00:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <20221019144119.3848027-1-arnd@kernel.org> <20221019150410.3851944-1-arnd@kernel.org>
 <20221019150410.3851944-11-arnd@kernel.org>
In-Reply-To: <20221019150410.3851944-11-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 20 Oct 2022 09:52:58 +0200
Message-ID: <CACRpkdaU8rHipXO+Lv9uwOd0AyBHtnKNikjQKXUYWV94+Dj_CQ@mail.gmail.com>
Subject: Re: [PATCH 11/17] gpio: remove iop driver
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Lennert Buytenhek <buytenh@wantstofly.org>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 19, 2022 at 5:14 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The iop32x platform was removed, and its gpio driver is now
> orphaned.
>
> Cc: Lennert Buytenhek <buytenh@wantstofly.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
