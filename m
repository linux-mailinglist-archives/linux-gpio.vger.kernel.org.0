Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4C38311E24
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Feb 2021 15:57:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbhBFO4u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 6 Feb 2021 09:56:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbhBFO4p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 6 Feb 2021 09:56:45 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 278A1C0611C0
        for <linux-gpio@vger.kernel.org>; Sat,  6 Feb 2021 06:56:08 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id y8so12900815ede.6
        for <linux-gpio@vger.kernel.org>; Sat, 06 Feb 2021 06:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=sY4fgq/DSyThalwU7QX+pWYKs/8sGH7ZznMUn5qQ1EY=;
        b=be9tjb+OWNHJndy1m5EocOdwIhBfISHHXuo03iHvkf99IBeAS2ZIP4zO+CffKoAXli
         wFT/YxtIr4WF2n1YSMwug96AX6h42NKZrdX6hvIP0FW987zbVxsareo/sU3roaLny3Pm
         1I0EAvIv2c3c8gMqzIhJboZgHRcl5wu2OT/70suQQY9rPZh+owVr7rQ4YbzNpmhfKrYI
         /WFKqkkmd6SPcZoTOVzYWmghpUGccg0Q45HGIh3V4O6JvUm92greLImmIug/U0fb2r4r
         q9VWwZUaDL82BSMDI5DQFGoKkEfp6hQ2o0DuZZGA9TKrtSyCuxJgVwhKlVG9/j3xxq6N
         +ONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=sY4fgq/DSyThalwU7QX+pWYKs/8sGH7ZznMUn5qQ1EY=;
        b=TZWlUS6wOXO2b1Cv2y5uM+3O7ZFB7JZbJm1zD6chRvAzxhgMcXxi2B6D2d9bsGR4Iy
         hMe5hchPeBzp09HN/SaBkabuVLaDGVsoGeaHwkWUB3+FTlNUBnlEvgbM3adCcs84QvkP
         pqKgY3fVSxAqSV0GAX/URDBrFtAhWGtbRwBhEB/Ir0vKhtp2PhyoX2iSmjNXj1JDYYrT
         xFP0SccdIG1V4DRiH0IKY+GUTR4/U6Ga4zew/36UjydEgAuKq4OoAAXyoDCFuC3yNQoF
         v9Ct9ZxQHOBGdqALABkY+4kCWKqIzNqq2rSc00VHK2YsFiOKkeqGsIBS6coe71+dHqlv
         tsTw==
X-Gm-Message-State: AOAM530oiRnpjv+mZ33F2vVvxeJruVE+ksQy/QDj3bCw3Xh9BMt4qZfU
        bS8TmCiGikM7b6zSjYHwDtC7YK6zfhqe7ZUYaOc=
X-Google-Smtp-Source: ABdhPJwg+95ztD5QblcuO+8CjjIKmoEQ6sWNyKmWrA0wQ2pVp+Zgel1cyodQV1zvNjOO8ObzDtcisUsYne5SMT74xW8=
X-Received: by 2002:a05:6402:13cd:: with SMTP id a13mr8813735edx.87.1612623366928;
 Sat, 06 Feb 2021 06:56:06 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:906:25d0:0:0:0:0 with HTTP; Sat, 6 Feb 2021 06:56:06
 -0800 (PST)
Reply-To: lawyer.nba@gmail.com
From:   Barrister Daven Bango <stephennbada9@gmail.com>
Date:   Sat, 6 Feb 2021 15:56:06 +0100
Message-ID: <CAGSHw-DxGPGtoG1+UQ6TB+LhiET-F_GxGO0MtswtFbtkGe4W1Q@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

--=20
Korisnik fonda =C4=8Destitanja, Va=C5=A1a sredstva za naknadu od 850.000,00
ameri=C4=8Dkih dolara odobrila je Me=C4=91unarodna monetarna organizacija (=
MMF)
u suradnji s (FBI) nakon mnogo istraga. =C4=8Cekamo da se obratimo za
dodatne informacije

Advokat: Daven Bango
Telefon: +22891667276
(URED MMF-a LOME TOGO)
