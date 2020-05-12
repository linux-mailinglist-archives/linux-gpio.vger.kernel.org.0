Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26C121CFAD2
	for <lists+linux-gpio@lfdr.de>; Tue, 12 May 2020 18:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbgELQe7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 May 2020 12:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbgELQe7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2020 12:34:59 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F9C8C061A0C
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2020 09:34:58 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id h10so539123iob.10
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2020 09:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=z9k+6rviq5Gi3g75tVkDmhujb6lRm71gHFQ4btrzf5w=;
        b=WU5SR7QmS6ksWyB6YcVTbiFFQymbYrwSrFS9OsYSVF+1lSU+EI+rLMhyj6zIxsl563
         sPangOsBV3ZpC85z6hJO/huMeAPcjPKyRPj2LKr7YpbkNwXZb/IIscHI/AZOFGTuZpGN
         EWVkSm7KWi3TCXvFa/D9XGn0EOhXCNbQKntAvIefmERzrwfHGwZbK3ox8NRjTvQcPKBB
         G+Of7lRgnBNCLW+EjOa68zKy6vTHwoZwwl8ENc2clnmpvtF7/SDWGLCJ3vKKcqUCbObv
         a9XLsXoAq2i2MKfVMlS3yebKqGbOWIvKlYDlYdOL1v8Ht3v1qRsXkCr+TH4aFzTUQopV
         SEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=z9k+6rviq5Gi3g75tVkDmhujb6lRm71gHFQ4btrzf5w=;
        b=PfLZlrFcqRR9i8D5Sp03nT0ftgQN8oZf2SuZL4E9gxqi7NRemEohpAt9s5EJlG60Wi
         UTIo8aKeIQkzFevIcYeH0Y6cON88waEdr44cXjbx/qebWJVI0ZXsxVhkeQ1FTTRXDqIr
         G7K5NJZOK9arRXgdyTEJwHgSO13yrnzx5PJ+3GY4XiObRKXFdfyWGNUs/AdcM/VrvcOW
         OoFS9XYv9scpZLOjtR67CAFFKhF+P9hiuBSNKp611S0TyNxybLPj6Ekw9dc6P/Ppf7Uf
         XNISBMAymIPslOnlQiWITGRKNFzEI08JAenZA3oesY2GU80u14kz4sKexX3hfskUTexC
         EJJw==
X-Gm-Message-State: AGi0Puayerj5hPiUnz8eJ1D7maz4vkmjFnpAIm5u8B5W+is0owNWCMzn
        QhplCkWowibckvmjUayJUyLFp/DzX+0HGZHI4fRwJgI4
X-Google-Smtp-Source: APiQypKbjRev2o9O8JleEtnIBDXz1Cs/0heQ1mjuI3paoetX7R09U1jN1brgSIW9GYgmaYtNe8Gfp2mZqkUyFK8PYhY=
X-Received: by 2002:a02:cd10:: with SMTP id g16mr13886722jaq.102.1589301297754;
 Tue, 12 May 2020 09:34:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200421194314.1305802-1-qsx@chaotikum.eu>
In-Reply-To: <20200421194314.1305802-1-qsx@chaotikum.eu>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 12 May 2020 18:34:47 +0200
Message-ID: <CAMRc=MfuRuPm_stA0ATkumLV9wxHmwdrdHeGprguW8tKx1ddqw@mail.gmail.com>
Subject: Re: [libgpiod PATCH] Fix documentation for newer Doxygen versions
To:     Thomas Schneider <qsx@chaotikum.eu>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 21 kwi 2020 o 22:03 Thomas Schneider <qsx@chaotikum.eu> napisa=C5=82(a=
):
>
> - The various groups used to be named __some_thing__, which was turned in=
to
>   <strong>=E2=80=A6</strong>.  A later stage of Doxygen barfed on that, a=
nd thus it
>   generated some warnings, and all documentation was in a group called =
=E2=80=9Cstrong=E2=80=9D.
> - The PERL_PATH config item has been deprecated.  Remove it.
>

Hi Thomas,

Thanks for the patch. Could you please split these changes into two
separate patches? Also: could you rebase on top of current master,
because this doesn't apply cleanly.

Bart
