Return-Path: <linux-gpio+bounces-30034-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5583CCED871
	for <lists+linux-gpio@lfdr.de>; Thu, 01 Jan 2026 23:56:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CB9B3007CBD
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jan 2026 22:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F6A28135D;
	Thu,  1 Jan 2026 22:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IYRH+e1x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336D6280014
	for <linux-gpio@vger.kernel.org>; Thu,  1 Jan 2026 22:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767307809; cv=none; b=tzO3eJdMHdw6BqzJczNuviz6qIfQnwbyRwogYU/tpAOjWzphN+74agCC1EUaJouJsEcj28dS8PKwrQDygtHhIzoMKe/TJxvxtLBtxVlJM2RsbzmKG4hO5YRTZ5Ry3qWBeJYdcAEakWTP/nfzXTFQvtvqumslUbSDfVIZ1B47b40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767307809; c=relaxed/simple;
	bh=qoQ2LWoUBAb80RcbR+OV8fg8vhcqgnhQ8/NW3hsNVFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VOf3DOOuBALkFEK1fLQAkJxbXxxgRpMvfzldBuRKBQOE0vh7KLYZEcooKwhBSjzA0nG71COCttBxJ30xzKcSYwWQNP5ndwGpXqDIw/gM4WaR2oJl/SqZWGKMsEZHso9+nP+O5acxAaCAVwwHg43/E3I0DkS7q7NAk3g9EkTMeE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IYRH+e1x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B60C1C19424
	for <linux-gpio@vger.kernel.org>; Thu,  1 Jan 2026 22:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767307808;
	bh=qoQ2LWoUBAb80RcbR+OV8fg8vhcqgnhQ8/NW3hsNVFk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IYRH+e1xZasvaKPQTcFF+l7qwCxD82O18aOK/MFql6CMiErq9pPez9MkpXc6fs+PR
	 vNIxJbPUcUpA0nR6mHzduQZbK0nBsS8EPnzFqpzTTKIbt9mlZiQEH+Hub7X/3udWkU
	 c2iC5P3APhxNoYuZmYKzhoJesw2LkcufH62SPxn8naJKYBu4mNUPQyBRvpQIxosjL2
	 i024rcHVvAvioc93SEzzqWXDBXL2NbAQaHbmPRcDkm2R2SJX+1rTz6XdQBb5EuCpXe
	 ky3FzontcHnhpfChURVpedREzdL+herqaKtMtDSlKPzhu+drjrcSJIdAzFjxVXPh2n
	 UWasZDHSCAIeA==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64472121ad5so6972032d50.0
        for <linux-gpio@vger.kernel.org>; Thu, 01 Jan 2026 14:50:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXv/foGbS9I4uPoYT3lo/JXpVmkGPm6lKFAn9zmTplpJ8qUngWUS2BQ/nATsTn1+qLQC9xWscEtMcFm@vger.kernel.org
X-Gm-Message-State: AOJu0YwlBmXHq8F6LAC8E4JMm/Sys5o/JnCArqTRO/8GB1AxqNLNxCaS
	25WnDSs20qMQ3NdzycgGnCOjRSLzy10bJ0/M9urcPmnTLS83fiFD27Kr7ZmoOdLcRDNCq+FJTtG
	ZSA7n0e09X1crBHMSMM73uD2ThzhrkwI=
X-Google-Smtp-Source: AGHT+IGrOLcTdHnWAvTikdGCf6UnlAcc0B+tsmqY9EjgNAatB1fqNxo0UDIF6456Ig9rz2ogunu8BgIZ5Cj1gcf0eoM=
X-Received: by 2002:a05:690e:2457:b0:644:60d9:7514 with SMTP id
 956f58d0204a3-6466a8c5b6emr24385932d50.88.1767307808085; Thu, 01 Jan 2026
 14:50:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251226-02-k3-pinctrl-v2-0-5172397e6831@gentoo.org>
In-Reply-To: <20251226-02-k3-pinctrl-v2-0-5172397e6831@gentoo.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Jan 2026 23:49:57 +0100
X-Gmail-Original-Message-ID: <CAD++jL=AeGETR9gT4dO4=MVokCubS4VbbsUdcwShYD8Kjybehg@mail.gmail.com>
X-Gm-Features: AQt7F2rP7_9KdxaprrRWjgopjc31HFpU37nXxJKU_cZD0aXworSU8dVIf4jtxh0
Message-ID: <CAD++jL=AeGETR9gT4dO4=MVokCubS4VbbsUdcwShYD8Kjybehg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: spacemit: add support for K3 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yixun,

thanks for your patches!

On Fri, Dec 26, 2025 at 1:58=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wrote:

> This series attempt to add pinctrl support for SpacemiT K3 SoC,
>
> I've removed the RFC tag as the driver is tested on K3 SoC.
>
> The K3 pinctrl IP shares almost same logic with previous K1 SoC generatio=
n,
> but has different register offset and pin configuration, I've introduced
> a pin_to_offset() function to handle the difference of register offset.
> for the drive strength and schmitter trigger settings, they are also chan=
ged.
>
> The patch #1 try to add pin support which should handle pin mux, while pa=
tch #2
> adjust drive strength and schmitter trigger settings accordingly for new =
SoC.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

As Krzysztof mentioned, try to use an explicit device tree schema to
enforce the legal drive strength values as e.g. enums.

Other than this the code looks fine so once the bindings are
ACK:ed I'm ready to merge this.

Yours,
Linus Walleij

