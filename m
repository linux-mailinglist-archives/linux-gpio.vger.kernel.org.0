Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 014921BBA15
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 11:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbgD1JmH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 05:42:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726486AbgD1JmG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 05:42:06 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51003C03C1AB
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 02:42:06 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id e25so20764108ljg.5
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 02:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WT6mF0IwJRAWJibfVj6jkV3JG6t831H/TM7wsxX5kmk=;
        b=Oc8uD1mS503FcEMlkUqEA6u5te4rKpMM/UsnhiU+pzKrxq6vCg8ReWomPx9ySZjDJr
         +Upu1NQfJO+9N/qO+diiboHKlAuEJqt9aZ34HX/ZsPFxm7O5vOSC3B8Rwi2sfl2TcR45
         oq9TMx8Y30Anq/gkwzDocYWGUdVgj9/lmWha+za55Aoq9wVaZP22v4DdjzkOAP0plN1V
         KumbSL9f451cSixc4MIxZOBdo+1+k+YAMuF1d2Svjh8djlHUICTmr/SGlky8XOl49+Cb
         Pf1WGvOF+fGJjYSzYy2u403Vg+4dsi6C5uSxe2QqlhAJlD48Vqs+BiUvJuRW0EFZ7g3H
         VMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WT6mF0IwJRAWJibfVj6jkV3JG6t831H/TM7wsxX5kmk=;
        b=JCSCD0XMQI3W+tWkb+clKIvBdWhqwQpkIYClBwNpnXK5Ce5u4E6xB0Nl1DHVrZD6fd
         wIOiarwwWZa4dlh9b/iJAmK2H0jlbCJtS2lsih8sHiOEdTSf1Y4Mh5fuGAKNhoN0rUEw
         mE1n716Sjg+3TMT+OlXYrWw56KGTLTmbcDEw71AxxOi+K0s0J9gcx5wI2iLlL/x1CZ+r
         iJX0Ix1BPRpHLmUWYOPvyROaabS15cOCfRZhe4K4h+BoiFwDcZwJ/4qhXX5U+B2dt/m+
         5nKKS1zAWUBgRpwwBJeGALatvl2Kiamb8N9j0PO9oasWHRIIPeqJdPtrijZoB2mdImaS
         UT+w==
X-Gm-Message-State: AGi0PuZNsssjrqec84duTBx3SZnoTMANrASm/a216CUuUkjKNXNKcNdT
        OsZvoTWi15QO1LWT1vphjNe1DUnRlzUV/oBFdfuzKQ==
X-Google-Smtp-Source: APiQypJWdiCBwLqc2g8Irmc7/w41rf19eHaus5+KTPDZiZJ8NEqF3rSuv3WOFk23DG+Abnjohh4H216Y6yGgj84RaY4=
X-Received: by 2002:a2e:2ac2:: with SMTP id q185mr8261669ljq.125.1588066924774;
 Tue, 28 Apr 2020 02:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200417073455.42146-1-yanaijie@huawei.com>
In-Reply-To: <20200417073455.42146-1-yanaijie@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Apr 2020 11:41:53 +0200
Message-ID: <CACRpkdZv4W3LVxRqDx2EaqATW7a-dhZeDjzoa2iQu+dDtpkfww@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nomadik: ab8505: remove unused 'gpio50_a_1_pins'
To:     Jason Yan <yanaijie@huawei.com>,
        Patrice CHOTARD <patrice.chotard@st.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 17, 2020 at 9:08 AM Jason Yan <yanaijie@huawei.com> wrote:

> Fix the following gcc warning:
>
> drivers/pinctrl/nomadik/pinctrl-ab8505.c:137:23: warning:
> =E2=80=98gpio50_a_1_pins=E2=80=99 defined but not used [-Wunused-const-va=
riable=3D]
>  static const unsigned gpio50_a_1_pins[] =3D { AB8505_PIN_L4 };
>                        ^~~~~~~~~~~~~~~
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

This should not be deleted, it should be used. I will send an alternative
patch with you as Reported-by.

Yours,
Linus Walleij
