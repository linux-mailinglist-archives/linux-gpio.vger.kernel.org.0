Return-Path: <linux-gpio+bounces-13324-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C4A9DA9EC
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 15:37:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43AA4164F90
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2024 14:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75BA41FF7A7;
	Wed, 27 Nov 2024 14:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GcPLpdl0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974921FECCB;
	Wed, 27 Nov 2024 14:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732718221; cv=none; b=Xq2z/noPtXCUZ4h37esmT/m20Bs1TTKXxKD/NDH1uret3jG1MDFp+RvsBBsDDwaeFDsvS2qGBPjQa8XIR9ywRa0tEMimg/awaK9f6xXfnu20gfDAC3NW81TB5qG08jhkd9FMP9H7G6y2AJ5S/UKgmA0UsICsClRwMPg256jPnn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732718221; c=relaxed/simple;
	bh=spaZDggYYtywRJ4kgtwhMtxKbrnoYAiIWhbsdMeY0e4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DcqYlrUfIGT0eh4KouqO0rGOafOXGI3axSPlkNmU+O7Ne55Xf5dkRHP9ClO0KjacVyE5KB9jHT/z8s0DVa/0ISldrlU60hBQDJSujVyQ3mcZTDVAW8H+dSwIEJu7yXjlWvMDXIwGmrsDwb8X1+8Bi1GoC75k+egISfujvpHfvvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GcPLpdl0; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ff550d37a6so76317501fa.0;
        Wed, 27 Nov 2024 06:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732718218; x=1733323018; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spaZDggYYtywRJ4kgtwhMtxKbrnoYAiIWhbsdMeY0e4=;
        b=GcPLpdl0LgCvsWvXhs4J1E5BnXJxaq1fc/bW3VGBur3F9hlCMSWnC6sEid6dPrIAgR
         /Bkd0x907VdmbR58Ci8dDFosmqZnnx70obd56sgJMxZbUmTUnaTNeqOeedqAmO13OhYp
         MyAnI0/JT+6KibkzXXrdmWoRGrFvPhR43M4seXGTpkJCmuSj9QZJ4WoxIV2EUj4kwrlm
         hxTtTGT2tsVSyZIGMlbPFfIfbzPfAJRikCMo4tn9mow2+a43qhfXjolqyxxbz4HVhwAa
         lomDQqm0cwgwpcii3d2IRg6RdLHdwNBuVdNFCQoK0pW6I7LL8kcOXkNAMKiAFvX/C5ln
         hhhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732718218; x=1733323018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spaZDggYYtywRJ4kgtwhMtxKbrnoYAiIWhbsdMeY0e4=;
        b=FJ43FSWu11CqYGG+HPjSpxu/7xTnhciwkp6uB+IZ2ACry/qwupDo9EiqGqlnlQM30/
         METynwPp6vI10yDBjxM9vvIdDxvwTR8ugoa1t5OQaogu/qY0YFyjFxnLsIkhawFdhfUM
         lH3x16sLq8Lpspvll/ntp5G6QqTCK+wpkQCh1YBAj75nz1di5olwIp8gCp7KMWtH8YRp
         NZXGP4fqoURaQVEENREl5kdS6oMI8fn6AB/URRAI5ZIA+/AEi6KDsbZrmcUjsvB/i+SS
         im0A3TfwNeF9+dKEdUr+sUM57rStlUdzFyL93B9ZQEA/jK9csukHKG4BO5GnH5DWKif0
         rMPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqGNd9TcIPVQ0jwX1qEq8n7JXYALbrRhreG4/07fJ+4qDj/p2F2CCz7TjltTKUXT/ok6hjnw167z5ppXcN@vger.kernel.org, AJvYcCXsJG8sX21idCrlalciYXKsp1yyBivD8ObipOOIzbpgEEm4vJaOG40UWO0M+DhsMGBY3OVOV07Sx/zg@vger.kernel.org
X-Gm-Message-State: AOJu0YyXWg80H3hUq4NHCTcEX/FHz6RdVUQ2G3zRuxQEnzrIqy72eGMb
	/OcHUjmgwKqe4zG1P3ENzwi60bEfyatkfaqIuJveVTgnOEvfuLpW8u7eaQcirqYfxklzQxBp8qe
	GS7d3QyPxU0NwxAtHrNrvmSpkfwE0eadm
X-Gm-Gg: ASbGncsIadV1lWCJOpDzH+LWVvbZzergb8Dt9qfmtiODlA0mw58RudgH0b47JLsAa+q
	5ljGH6DPjTR+QcQaMl2Q3nmv81JFovRVl4LR/SYJN3KJF7nycL0FT8uGgEXwkHw==
X-Google-Smtp-Source: AGHT+IE2Y1pwt9tFpc2i5mwaMDyiDpAZKOHFBSgRH1+njHEYwg26v01EbLgq7h2hGHIiXKKBL6YXf0n/tChU6h7R74Y=
X-Received: by 2002:a2e:be0d:0:b0:2ff:d2fd:fc94 with SMTP id
 38308e7fff4ca-2ffd6142a7cmr18766941fa.32.1732718217502; Wed, 27 Nov 2024
 06:36:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
 <20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>
 <49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net> <CACRpkdaBR5mmj43y_80b9jd3TAqRWMdCyD9EP6AY-Y0-asz4TA@mail.gmail.com>
 <1ff005f8-384d-465e-9597-b6d5fd903862@roeck-us.net> <CAOMZO5DW3t-sof_uaFa_qJPE3WFq_155mFTxGMWh0m++csgopg@mail.gmail.com>
 <87ttbthwdu.fsf@prevas.dk> <5881df5a-9495-49b9-9956-0538055bba60@app.fastmail.com>
 <87ldx5htm3.fsf@prevas.dk> <45ba6632-43f0-4142-85f8-9dc3f9d1e698@app.fastmail.com>
In-Reply-To: <45ba6632-43f0-4142-85f8-9dc3f9d1e698@app.fastmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 27 Nov 2024 11:36:46 -0300
Message-ID: <CAOMZO5BY56N9Sfm1_qprQm7jeM+5bLgR0CPeu3kXK9rgmJN87Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ARM: imx: Allow user to disable pinctrl
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rasmus Villemoes <ravi@prevas.dk>, Guenter Roeck <linux@roeck-us.net>, 
	Linus Walleij <linus.walleij@linaro.org>, Esben Haabendal <esben@geanix.com>, 
	Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 8:30=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:

> Overall, my best advice here is still to not change the way
> i.MX pinctrl works at all, but just fix Layerscape to not depend
> on i.MX. The reason for the 'select' here is clearly that the
> i.MX machines would fail to boot without pinctrl, and changing
> that because of Layerscape seems backwards.

The suggestion to make Layerscape independent of i.MX makes sense, but
I don't know if it can be safely applied in 6.13-rc.

This proposed change also has the risk of causing regressions.

What if we revert the patch in Subject for now and then someone (maybe
Esben) tries again for a proper fix targeting 6.14?

