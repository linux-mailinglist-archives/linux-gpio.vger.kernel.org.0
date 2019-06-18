Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC40949EBF
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 12:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729010AbfFRK7C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 06:59:02 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40951 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbfFRK7C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 06:59:02 -0400
Received: by mail-wr1-f66.google.com with SMTP id p11so13461866wre.7;
        Tue, 18 Jun 2019 03:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=erWl2ztGQC1+LMUU2GDgbAUN0dxGbS3XfDl1jE6l2ow=;
        b=vEKCtOARKjx5EDFmxAJP5qqdrxjSakRCZS/TgKM4RtapEG3kuF3EcgT+PH7T7Et5xP
         YFmWyPUzNyz/Sikfrd2Wvs40djchhc4QsPzZFtFYyvgb6MmHE6gVCk2iSkxw/iFYYAB2
         DiqR/87gvY86T+U12boAwdwwjhnXBlsraE2LNmc/5SVXbQ259vZ3kym0MHWOzSsNGg4/
         rDCrjn4s2Op1omFqMkOwkdQF4QzgQnymUDW9oSFeC3YCHPSwjxmZYUUzDMhSL5kdCIXj
         s5YZLLa7iVK+sg56EJFDFhGVN09zKD0Pla3p/go1FbagxfZnqlyQpfcMiPHyUIKYA/bI
         G2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=erWl2ztGQC1+LMUU2GDgbAUN0dxGbS3XfDl1jE6l2ow=;
        b=gmg5204szueOsUlOSb7aV8zd9Z91VtoNjanULaRk0vkOb8vxPrAB5jGgtBn/3m3oaY
         gDv5dB71bL2BX3J/NQaPXsWfT1ZkufciIlptT5pEH3yN6xSLDjKrTWf33EV8oIfugTpx
         m7p85PT3Q3w/uObDawqkajwCWrLy2BKTWxpebV7UpAeFSa2zowIOlq2iWwZYsSQXq9GZ
         TvH4lY1XoU+aUn/wwHVKmWro/ewzrUWSvrweRafqZ7GgazpHVvaK31f8ZhDk/QtpEfZx
         OOI5oOokPTza5R/qdR5jI09B4lEc5BaILyW5yuewoPeDe3qP/FFem4S4rVy/t1RLEk+j
         6LWw==
X-Gm-Message-State: APjAAAVifWmQQ4PXz5uBsUXOP1rVFKUkklbi4+XP8p8tk+tPOpnkGsKW
        FPA1NVAoimB9lbgFvtPGwws=
X-Google-Smtp-Source: APXvYqyrCJUtg1gqiMWv2NhNK6EU8WMp4kmrJ0w+oq+L1m8gW/h13kuBpFPjrwh8Cp3+wVCytRNK9g==
X-Received: by 2002:a5d:4a90:: with SMTP id o16mr22664381wrq.13.1560855539430;
        Tue, 18 Jun 2019 03:58:59 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id l1sm1930397wmg.13.2019.06.18.03.58.58
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 03:58:58 -0700 (PDT)
Date:   Tue, 18 Jun 2019 12:58:57 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net,
        marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch,
        mark.rutland@arm.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
        sboyd@kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com,
        talho@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, mperttunen@nvidia.com,
        spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH V3 01/17] irqchip: tegra: do not disable COP IRQ during
 suspend
Message-ID: <20190618105857.GD28892@ulmo>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
 <1560843991-24123-2-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RhUH2Ysw6aD5utA4"
Content-Disposition: inline
In-Reply-To: <1560843991-24123-2-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--RhUH2Ysw6aD5utA4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 12:46:15AM -0700, Sowjanya Komatineni wrote:
> Tegra210 platforms use sc7 entry firmware to program Tegra LP0/SC7 entry
> sequence and sc7 entry firmware is run from COP/BPMP-Lite.
>=20
> So, COP/BPMP-Lite still need IRQ function to finish SC7 suspend sequence
> for Tegra210.
>=20
> This patch has fix for leaving the COP IRQ enabled for Tegra210 during
> interrupt controller suspend operation.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/irqchip/irq-tegra.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--RhUH2Ysw6aD5utA4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0Iw/EACgkQ3SOs138+
s6GLLRAAvKzInFHRhecpwNZPDwkUnBKfQIyiErHNkSUfLXJP6QSIaQa+BCBJuoNf
BTxROMwnCIJebjytKZIoLlNjND82Hk/5NDNhjivrBhsXVdmL4vCnlwFNSCQNEqbi
Hp2iVP/LtvGNaeG2Wrp3UD8bA7w4Qb94jXItmE2iwLfCaJV+7myCiySGJea3CTqQ
p7PCgu0joBLlfFG9nYE/JA+VAZPSi+IV7mCvyWquvVV7nfca1Cjfje1FcJDn08YI
eTMxfqj+hSUrmYadTXgqERUoZOPHjaQ/TGTyTsyWKsFvR/zTB9PNZpzo7o7wOnik
0ph9gZo4LKY88tSzdK9AM+r3F5sMQCXM8WAETePUrrADLLRUEQvnTKeG3tJvaIRB
Zk1WbiJIXH7K54epAeuLnu4zHFj5XFaDs4orPkXhF36d1BouB01KZ9KytMnnrRUv
tIVMGNDFuYV77jKUdAVUl0qBoZmFaYDW+WfGfassadJEpgJDNR4SgkhJZrq2O0VF
3J2mc8k0frM0EPbtldLOpAMGJbAbchHFKd51mRxVNBLYFzA9N8N+d6oC15ZIpBKN
iiM35hN9xskQpJdZJYsNBISdEW8+9AcODhhY8FrD6B8IvV4wPaTvmdAj+NhI17As
M1P9Sm4OTVElx0ApVdGLDdDir6s/I5CiErAqXEQejQKlmMbAxnI=
=NwCH
-----END PGP SIGNATURE-----

--RhUH2Ysw6aD5utA4--
