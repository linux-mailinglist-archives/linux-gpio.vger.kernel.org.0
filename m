Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F221F3EBF97
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Aug 2021 04:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236506AbhHNCGp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Aug 2021 22:06:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236523AbhHNCGo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Aug 2021 22:06:44 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99DC5C0613A3
        for <linux-gpio@vger.kernel.org>; Fri, 13 Aug 2021 19:06:16 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id n7so18449942ljq.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Aug 2021 19:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=7Xq9jb2sUMv3xaNw7Q5Cgt7yCkc3M0xn16Wn4AtIDKI=;
        b=bMjFQnnAZpaPHPewg53a/655rlJcZF3F6tOCYZw1vRKDz/xIJdx97rNr27JLkW56nx
         /iUhkVkrv2vt56YQtzEazhRgIPy/DINH4WyHeEexrKrG7liGbayL7Temc7NGvW0bB8Ad
         jYLKY+nfNSoS1rYKoflW5LtIinkjSZBTTSJCtk74RyRz5/H1kPwLgMirqvm1jZ9Q2lvS
         mysy6xLOxs0wYu9KWpVs3ZVzmyzuM6cY3iz+yVlGPkz3Lkb+v57sIQRRUb+ypy4gjifF
         STYdF7upxk4m3MFQNQv0T7Zw+Yt5F/OYhuRsX60kpa6PLdNBh1LpNqMT51M2pasOSTPy
         0wUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=7Xq9jb2sUMv3xaNw7Q5Cgt7yCkc3M0xn16Wn4AtIDKI=;
        b=NvLpBQmX/ACmGOfQR64zMQFULz3Wke9dgKqN45a729uUkGYrpzV6LjOW/deE1vBV12
         bhLP5bmxsLICPg6s11WIMTb2ilM2zktDaf3oucZvdfwdXFGvsifnPXIH+8+iVRpjhoRP
         tDUUfFIPtJZZZo5d72vtdLWez55cWYK68046wh1NwdNCoULu1IjwmFaVuST/JV/EF0mf
         0LJZHsG/J87ocqqezEYMQjvbgmC/S0Gb0pIRDQJKGs1TKxoOTWBlZ3cdZKplRGLlUAt2
         UQ6FTWnPO3RF79gB+QSaxSC5MDQc1Qo+TnZBY+pYjE3gmAhJZFILIhXp2rA20mFnKXb5
         itPA==
X-Gm-Message-State: AOAM53264g6FS8m9cLdaRnl2vES/0FOJQ+tT9XgNme/uLDHxsLDUydrU
        So/Jyv1bGPVBairZBWyC14QKj5X/HenbmWiEEFI=
X-Google-Smtp-Source: ABdhPJynvegPmhEjUi/stm1v/NRwCcvEqe4+RCpcxOCwnF//w8aRyIcHmBxFidm29bl0vBPsC1zhmU0XtHDcktPhkc0=
X-Received: by 2002:a2e:b1d3:: with SMTP id e19mr3920584lja.6.1628906774714;
 Fri, 13 Aug 2021 19:06:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6520:380d:b029:132:4f79:3ded with HTTP; Fri, 13 Aug 2021
 19:06:14 -0700 (PDT)
Reply-To: deedeepaul@yandex.com
From:   Deedee Paul <deedeepaul212@gmail.com>
Date:   Sat, 14 Aug 2021 02:06:14 +0000
Message-ID: <CADS-zP8AceijWYuKjjfFaC4WB2nM3FQqvpU1ob6Xb=P4w5FpkA@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Attention: Beneficiary,

This is to officially inform you that we have been having meetings for
the past weeks now which ended Two days ago with Mr. John W. Ashe,
President of the 68th session of the UN General Assembly, Mr. David
R.Malpass. the World Bank President and Hon. Mrs. Christine Laggard
(IMF) Director General, in the meeting we talked about how to
compensate Scam victim's people and all the people that were affected
the most by this Coronavirus pandemic.

Your email address was successfully selected for this donation with others.

The United Nations have agreed to compensate you with the sum of
($150,000.00) One hundred and fifty thousand United States Dollars. We
have arranged your payment through WORLD ATM MASTERCARD which is the
latest instruction from the World Bank Group.

For the collection of your WORLD ATM MASTERCARD contact our
representative Rev. David Wood, send to him your contact address where
you want your MASTERCARD to be sent to you, like

1. Your Full Name: .........
2. Your Country and Your Delivery Home Address: ........
3. Your Telephone: ..............

His e-mail address: (ddavidwood1@yandex.com) He is a Canadian (UN)
representative Agent.

Thanks.
Tel: 1 513 452 4352.
Mr. Michael M=C3=B8ller Director-General of the United Nations Office
