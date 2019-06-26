Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9DBD56657
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 12:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbfFZKMS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 06:12:18 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46930 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbfFZKMS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 06:12:18 -0400
Received: by mail-wr1-f66.google.com with SMTP id n4so1992150wrw.13;
        Wed, 26 Jun 2019 03:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Dibq7+zbPZLIpwPHa4nvk1UvCebsATcld77EwT73l8c=;
        b=h3F2vgosynP1Knelmy5Gmqhsk7vUJK9xKEMeaMdR6n8sY9R2YElOv+IFBAU6toZwEt
         EEebPXGmzj135SUmx7ofG0AS81/4h7dSEDPi4vD3WncXbx3riaL5TBmbAAobXhj67HKS
         4IrjVzkIfLejBP/cu1Zr1tOMF0U6GPRpoHnDXyyCoQrB6WAnDy8r26yZnY2fXGCFDmbl
         qek2IvmUgXx1PRWaPgo4xN9i1el7k11MctecdMrnsACy3IN0YvOPGG1DG5eqjDayRxYJ
         irrWYwVOz7DXZ873njHWt48GaYIcCXw7tAMR3r7Ma0N8xxc2fbNA8Xw2QitZUhTWK1mU
         lXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Dibq7+zbPZLIpwPHa4nvk1UvCebsATcld77EwT73l8c=;
        b=ICkRKxfn4JmOh4zgKl/JXBtJCBRXX8073wB0mKefvOohg6ND9Wr/f2ZHcGf75Ch6nP
         79tFLYbOmIlDBgmLuiHvpexM4+haZKO6Io8x7TWPciSL6cD8KPkcmbbBP3ysmfrRqqff
         dIWumWpgTRJ/tjEN5bahtaFzQ8bPPbNpBVTS1KXJUWXSuRZ4Dq9bUDWfQVfIJxucYb7e
         1ikrgcQhtGaKbXPaKbUB2Vic5Yaden+JJsv8nKAsYl5EI7hgEl5kBi0Y0kTJlrP77T+x
         2ByiHNiSdxXvtMgDvpFzf1JjGAO2xHF3WP/83T6gTZmb/TzWa07bCGY42yV6kHsoRNUq
         lZEQ==
X-Gm-Message-State: APjAAAVpAjzZrlCzqwtwwVZdBnlCIXlFbbwxakDRoCxdm5lKdcyhqcwE
        C9aysMPkFf947Y3MC+hteKs=
X-Google-Smtp-Source: APXvYqy/ki8Ln90KvN3IcTp8a007eI8cPfnHLI2q5Mmu15NZXsoILdrxtact8/Faz40GvWLmZg+1gw==
X-Received: by 2002:a5d:42ca:: with SMTP id t10mr3214670wrr.202.1561543935270;
        Wed, 26 Jun 2019 03:12:15 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id j189sm1923150wmb.48.2019.06.26.03.12.14
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 26 Jun 2019 03:12:14 -0700 (PDT)
Date:   Wed, 26 Jun 2019 12:12:13 +0200
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
Subject: Re: [PATCH V4 10/18] clk: tegra: add save and restore context
 support for peripheral clocks
Message-ID: <20190626101213.GC6362@ulmo>
References: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
 <1561345379-2429-11-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uh9ZiVrAOUUm9fzH"
Content-Disposition: inline
In-Reply-To: <1561345379-2429-11-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--uh9ZiVrAOUUm9fzH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2019 at 08:02:51PM -0700, Sowjanya Komatineni wrote:
> This patch implements save and restore context for peripheral fixed
> clock ops, peripheral gate clock ops, sdmmc mux clock ops, and
> peripheral clock ops.
>=20
> During system suspend, core power goes off and looses the settings
> of the Tegra CAR controller registers.
>=20
> So during suspend entry clock and reset state of peripherals is saved
> and on resume they are restored to have clocks back to same rate and
> state as before suspend.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-periph-fixed.c | 31 ++++++++++++++++++++++++++
>  drivers/clk/tegra/clk-periph-gate.c  | 34 ++++++++++++++++++++++++++++
>  drivers/clk/tegra/clk-periph.c       | 43 ++++++++++++++++++++++++++++++=
++++++
>  drivers/clk/tegra/clk-sdmmc-mux.c    | 30 +++++++++++++++++++++++++
>  drivers/clk/tegra/clk.h              |  8 +++++++
>  5 files changed, 146 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--uh9ZiVrAOUUm9fzH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0TRP0ACgkQ3SOs138+
s6HUlxAAg/MnASD5SEdQ3qYEq3xg2eWTdZZD+3JhKSO+AJM87Pcw4Q+k+vAaG5fC
iZ1QPSnJwL6M8iyjlOwM+J9ZJR+0ZtrHlBZ2Ru+wvKbUCN3fBXg0n7iFEwtWfRwe
6nut9ykShtaLtoq7bg3XFJr4OmZONSj+tsXBDJnCYwHSHSerV/+ElJhB9U94I34s
52DayIuq6xO2DOqo3HCP6nOFRsev73+vFJSZHFxANWiDcMW4XzZ62wZJ6DQLUmuC
vsdEE0SbCuUhPoAsC4G1sqB39EIg8eIgBKPgOlLuCc5TazZdglt3eGfjmsw+/AR9
6ezH/g9lKZ3h9JtZkkM1gckkj8TLpToP00VFV1m6KD3xLGsslhwPLAQT171Sphia
pyLO8rxqaYyX9boAHOGsq03kFmlr6/uVHn3bxa/vhcsX5/iOzVGZUHwqC50ATm5R
yHPx38hJIAQuFcv+OfSigkAOkXHhPAOSICisE/Mp8v5Ecb4bNF4H+GDpcgkSvrFp
luAmTT/PLaixvu6B+r+BKbRpp8llcaAzMNS2I6YsnLGHupt6LuIzprwTxDQ1xcDm
eZZH5kjMP8wBrynMHGdhnAYUIXgADVz07RLZ9E3Tr1Ur4yHBIJRHD5sUU/u5ILJI
CLOaAS+4RVlCizUE7ILijzsWb19EmLpwcbB1GLCgK7FW3nae51s=
=Fq1s
-----END PGP SIGNATURE-----

--uh9ZiVrAOUUm9fzH--
