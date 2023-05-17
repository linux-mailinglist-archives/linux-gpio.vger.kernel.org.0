Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A85FB706451
	for <lists+linux-gpio@lfdr.de>; Wed, 17 May 2023 11:41:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbjEQJlP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 May 2023 05:41:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbjEQJlK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 May 2023 05:41:10 -0400
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A201840C0
        for <linux-gpio@vger.kernel.org>; Wed, 17 May 2023 02:41:09 -0700 (PDT)
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-77d049b9040so7760416241.1
        for <linux-gpio@vger.kernel.org>; Wed, 17 May 2023 02:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684316468; x=1686908468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sq/IFKZKyX+IB89ZbjKiv/ig5JK+qk3imm5iXCJqO0M=;
        b=aFAnRY+Wr4q819ZMJgkWFYqS5RUrLhLJrp38gGW2sv9uwFge4rVzFDJZoyvPQKK8pk
         Z0d+OOL1c5iJ/cb+p5gByrCB8FBdbg5lLfeBlts0ecdB9Yv43Y7st8joTAZBw0/L3Ti9
         ADnb+TnxLDGDIO6dsxhm6BIWPkQpjzbMrznNSX1wUkzWiZnnOXnluhoQN1fzMmlGaUAB
         8On4SyccEHXfJGrXod5WF5rG97jR4o+M9/z/hBc/VP96NBtZ5Vq9SyGloEeXM7YRodfx
         9cMrtL9Jm6lFY3rLMGe/3/TKNjwS5LWooqftxGZ2XAorXmFKTpmO74Spbl3Y/EWiZJxv
         VYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684316468; x=1686908468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sq/IFKZKyX+IB89ZbjKiv/ig5JK+qk3imm5iXCJqO0M=;
        b=VpPz4jYCMswOxTsO5VYBwbBk0rVMV25k9PFgqie44exzpmZc4tTOLx0qRIftbJBJbW
         Rzpn+Hgq7NVZ79UaXVMmnyW041ZOBVfjkCr2+CtwOG9bKimZgm1QX7S4RCqp3Ge9B89R
         IzbZZ0L+EwqLlWofVF3QxC3zYi6rrKFVf8IMBL77tqKWqYaLzCsihwlWZHYP/ox9603L
         ExJcevtXYOGzt5p/wfB61wNEbAsWXZDL124wpcu+AvQLmfVFjMr9EDvioiSh3fcXhPKC
         0x/5yKoHpY/kG5Lze+e8+wDsz1VGj3cGB6QqCRBFVWY9rUVBamvBAp0vfxcJ1e7sLJYm
         H6Pg==
X-Gm-Message-State: AC+VfDxpf7CPVCNI9kgDa0B5dEF8zqLW7dD4D8vB2oKAlZP1ImcJwR2N
        MuIG9cFCEhOG8so8tNe/7P7hKj/6w3pLNmbB2WPyqg==
X-Google-Smtp-Source: ACHHUZ4YjpyYlgvfo8KGHpgh0GWzkYCR851yUBN4sNRfUbMSZJJvvB0n+pjZsdRUpzebhyQvam7dxS44VOBGN+Fo6ls=
X-Received: by 2002:a05:6102:578a:b0:436:213e:b76 with SMTP id
 dh10-20020a056102578a00b00436213e0b76mr537689vsb.1.1684316468682; Wed, 17 May
 2023 02:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230515174518.494907-1-afd@ti.com>
In-Reply-To: <20230515174518.494907-1-afd@ti.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 17 May 2023 11:40:58 +0200
Message-ID: <CAMRc=MeiAD2ZQ-uAyR2GfceEeL4qHu9apE8HnimZKokzsNAu0Q@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: tps65086: Use devm_gpiochip_add_data() to
 simplify remove path
To:     Andrew Davis <afd@ti.com>
Cc:     Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 15, 2023 at 7:45=E2=80=AFPM Andrew Davis <afd@ti.com> wrote:
>
> Use devm version of gpiochip add function to handle removal for us.
>
> While here update copyright and module author.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---

Applied, thanks!

Bart
