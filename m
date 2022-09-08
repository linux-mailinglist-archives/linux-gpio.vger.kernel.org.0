Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16CEA5B1753
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Sep 2022 10:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231183AbiIHIkb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Sep 2022 04:40:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231238AbiIHIk1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2022 04:40:27 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87D2F9E895
        for <linux-gpio@vger.kernel.org>; Thu,  8 Sep 2022 01:40:25 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id a70so7119454edf.10
        for <linux-gpio@vger.kernel.org>; Thu, 08 Sep 2022 01:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=QvDzqY2hjVaNgPAWrfBGXhW6k1ypWOnwlPzqmniUjzs=;
        b=cKMExsE4llX1yiRL6nddDLOc7f5eRDKHQY9BFAKukSDU6p5qPUT/qlX0qsqsThmlk+
         /HHgIksrwKGHcpkmmQx4xp6CJd0tcEMwpIayxXuxUVlGHlNuRi+d38ok/nDQL71Dl5MR
         9fm9GWHorQ67KoJ7hL04xsn7v7tuaK6qDpSaTpijIFdjHnn3XCuqfBJTlYaMZpzeqZrh
         Rt4+TGsKaH6rnt/pxd63NY0KjdeRekqStlHtKTO+B1WhG24RJqttHMNSHl1xsHsICdEg
         isGfB8C0ygjXF9zVODiUK3L2Qlx/syGK42BJWSAo1Xn2OaaJOtm1rsCsxW/k3Wi6FMmf
         +tJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=QvDzqY2hjVaNgPAWrfBGXhW6k1ypWOnwlPzqmniUjzs=;
        b=T6L/st02Eihu5ND+IEpQ/ujYvgWg4TW+uLim9IOW0PTSyj891LERldLj53Lh4XLx3w
         xHVMTaqwDhApgKhCfYhZq7YYoAMuMSSRkj4nzaxG0cyt/nTS978GhcKKj2WMMtnPrbYV
         EXRKAXaDJFzk4UBU3MzFtQyEp+cAWqc0/oTjldQDe/9BBvXxqKMeCxa7iz4KLOl5cJkT
         /QjE/rTAEvG7SlJbIEHUzJdEqUDmfZF+ClgLIN7sjf2JFtta0R+HIxg01aA++H0JJtio
         OOpNp/vE84/4OSh1qKiih6rQd9SD56NfPkmehb5EEa/Otv0jlPpHUTriT3lnMLtDr3H0
         ukIA==
X-Gm-Message-State: ACgBeo3s9vLctybhGjW9iCslhQtwqHWOhxT3udj0dwxh5f+a4K1MXnH4
        g7Por8HobXURnKd7g/YkXrM30eHLFkMc7e0nd3SjDY4Or+mXlg==
X-Google-Smtp-Source: AA6agR4zR0djfYE9/8fJNaKKNolyAXhKrAvX4YMH/GOJAHYeF72v+Sk3vApAaY9yIrfgOxpkVXbrmQuJ7NA43Y8ZTec=
X-Received: by 2002:aa7:d6d9:0:b0:44d:e1b7:d905 with SMTP id
 x25-20020aa7d6d9000000b0044de1b7d905mr6263350edr.32.1662626423832; Thu, 08
 Sep 2022 01:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220906132557.3916-1-wangdeming@inspur.com>
In-Reply-To: <20220906132557.3916-1-wangdeming@inspur.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Sep 2022 10:40:12 +0200
Message-ID: <CACRpkdbzB+UH2eLhMxP-BND-5eW7J6cqieOdTSy3c_ZG8hcgQg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Fix spelling typo in comment.
To:     Deming Wang <wangdeming@inspur.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 7, 2022 at 4:12 AM Deming Wang <wangdeming@inspur.com> wrote:

> fix the world maxiumum to maximum.
>
> Signed-off-by: Deming Wang <wangdeming@inspur.com>

This is already fixed upstream.
Thanks anyway!

Yours,
Linus Walleij
