Return-Path: <linux-gpio+bounces-30717-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA26D39B99
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 01:12:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5E51D3002842
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jan 2026 00:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2C3761FFE;
	Mon, 19 Jan 2026 00:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nW7h+1My"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8252611713
	for <linux-gpio@vger.kernel.org>; Mon, 19 Jan 2026 00:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768781551; cv=none; b=NGOar2ujbdD5eSxTalAxnxYEhBhpOR5psD6ANEXITQXj/Emo/5G6lk+Is9nSNzfX2SKWHRcG21JJxr5kgQrQQqMn2SHssnI6ppBDpG07fJgCvNAUE6mpZ1XGRSy+RJQt3/SQl1gtBgZEhlTHsPV5z1n14dm2dPdZypej272JPas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768781551; c=relaxed/simple;
	bh=GM6hjWxnbx0Rs5/7Y45dHtccDdEstdeBQZhCBY29WCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Px3d1yEtAqXFD6xuu1QQztrsTOmZy7CJ/xLqu6s9HbuZg61gom/7OnnJtLM1lUNbnDtfv7Vlidw1+tySRjrmmunNlkNDVOodAVbNt+qCgyu1fTIK2V/8tGpbHF0ix9GtoAAxTWvaxn/MO1o3bU4It5O3nx1JNuxhwbCCyo8FHeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nW7h+1My; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51157C2BC9E
	for <linux-gpio@vger.kernel.org>; Mon, 19 Jan 2026 00:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768781551;
	bh=GM6hjWxnbx0Rs5/7Y45dHtccDdEstdeBQZhCBY29WCk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nW7h+1MyHv+XY/D+QMgQoPSEsvqC4xZS08EgMm5QgWJWAQqCzRkqWlAFfEeFeKwzk
	 uoviDMATdhhTN9GYHHY9iRFzkaxxUD9pLBAMVOYbGJeVRuCnSJApuxVhY8BCvxlQ5E
	 dgoArPak6gRs4bBLk5jVHbVkVkg4zsSs+2pVVD3EOiqYMmh34OZJEd/rJul6jkgQJ+
	 e9oaDFyyAJoQ1Qp1DeErXTf+NherfvJ7rOJgwo457Bfp0Mm6oQ9fii3A6VAYrU5mb5
	 JbGTWaIr7+xmJpWRxkx0Zf99/arNagUn4ATg1W9VXanBKldhTQJ3Mec8vROa2lsBl2
	 3o8700Mmbeq+g==
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-649295a4a5bso417303d50.2
        for <linux-gpio@vger.kernel.org>; Sun, 18 Jan 2026 16:12:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX97+TJ0oK7CXqHeQ4+wAbGAOpq8NFOR8mF43BKNAI2COWPqk1uxQ4jL/qlmppePLBlxl5uKnR25CjK@vger.kernel.org
X-Gm-Message-State: AOJu0YwB5/wL/l+MTa+2CS7WgwPtM4RcEjVe3HIbpowzW/wtPDQmJeTp
	jKFLJDyY9Or59Yq//7KAeDEHlM3f35aMqp4j8WHVlcZTmV79yfQ2wIE0Mt/yOdRNch0tjCVONZI
	xZqAtHCoEYafjLaP+fnt2HXTfVP0WGkI=
X-Received: by 2002:a05:690c:f96:b0:788:989:fdae with SMTP id
 00721157ae682-793c52a3abdmr187836947b3.28.1768781550470; Sun, 18 Jan 2026
 16:12:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
In-Reply-To: <20260118-pinctrl-cleanup-guard-v2-0-bd36f681bdc0@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 19 Jan 2026 01:12:19 +0100
X-Gmail-Original-Message-ID: <CAD++jL=+MP0UZsPRAh=+1TL+7ow+rZ_VqNW=XZN1Ht82Lw88FQ@mail.gmail.com>
X-Gm-Features: AZwV_QgFwFIzeGhMFaeDXLwmJd24DRy_tYYmpsNkgD6HAMBqdqwm-YSi6s6fPfs
Message-ID: <CAD++jL=+MP0UZsPRAh=+1TL+7ow+rZ_VqNW=XZN1Ht82Lw88FQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] pinctrl: Some code cleanup including guards
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
	Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Heiko Stuebner <heiko@sntech.de>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 18, 2026 at 7:10=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Changes in v2:
> - Patch #9 (pinctrl: tegra-xusb) - Drop stale mutex_unlock (Jon)
> - Add tags
> - Link to v1: https://patch.msgid.link/20260114-pinctrl-cleanup-guard-v1-=
0-a14572685cd3@oss.qualcomm.com
>
> Few cleanups - from unused headers - or code simplifyings, including
> usage of guards when beneficial.  I did not conver cases where guards
> would be mixed with gotos, because this is discouraged practice.

v2 looks good so patches applied!

Yours,
Linus Walleij

