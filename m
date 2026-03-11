Return-Path: <linux-gpio+bounces-33130-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PA5JM1nsWnsugIAu9opvQ
	(envelope-from <linux-gpio+bounces-33130-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:02:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF7B2640EE
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 14:02:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 92CCD302E116
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 13:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F130E2F5474;
	Wed, 11 Mar 2026 13:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NI7ClO74"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EC82E612E
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 13:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234113; cv=none; b=EwomEFMot23s4+gI3O6/EjdaHj9ehI+jGqkiNyWhe65QhAyog4tSs4Nd/eEB/bSocUx3Fa47vWB1ElkZf6fQ5uE6o2j+38eTJAJDBc0EmI9V/sTJ7+cThGqGunIPzOdcIoHY/XHD5m92t5yOS2MkznAeHyhLCPcN7ZNbufcfBXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234113; c=relaxed/simple;
	bh=cOdofdA9uxeFswZkahSYK7BRxl91B+cEYHK/tWphMDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KI8m3m7SWvjTe7njeYZXs+5p7gkne/oX15vlg4vxYZoKTX6kGPQiZHVZOuE4FCWzwGbpYogAjDK2bFGDTQtFDOgxZSq8vtFwS8GItqL2wGOV+ES7JGFoAEtHEAZOKPE0qD5tZDP9Ue61/k2JRYKYkJuqWTnUYN0EIJSPgExpq+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NI7ClO74; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A8C8C2BC9E
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 13:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773234113;
	bh=cOdofdA9uxeFswZkahSYK7BRxl91B+cEYHK/tWphMDY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NI7ClO74gRHvMrgk0qQ4jwb/kGCbUcNcMdDsTteav/31BBCZe9qNwBbqG0jWe+0x8
	 jcE+9JIf9sELxodZwKmvA5z6GBEi8kfgF5vwmW85qbznDrAPvycK0Q6AYVwLIPPmWA
	 cZvGCwvlicAO2ZYwRhP+KwZhjaHbPzJYHxu+jZsnNhddSvNI42IJHwnzR93+bJAlLr
	 PxiYQU5Azl3LtCzbQyxvm2vHk/ud+eE1afc0tQ65lL35Ek2qDwSh0JyzFLBPzDwzpK
	 muuB2D8r8P5ntTAXPtb+rH7mEjNrtj6++UYtPRm1SaxtJkH1TsO1qIfTmkRxOVyrex
	 v49wPLTvKoWtw==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79801df3e42so13121387b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 06:01:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVginUwPobB28Dc5B6WCP0lzSoi78aVNn3YRXFB8aZ2GfKQqP07/ZEHwYbUopZIOQ+wySvjy63gfrcG@vger.kernel.org
X-Gm-Message-State: AOJu0YwcteAqYhWYBIMKciFJAGd8snDLuyj+N93ChONnNC+zzx0OG42L
	DeO8F2lXUAgY/7vhgbGc40sClyET4Ta5qS5fCfQO+/q8VBHsOoLeOIImv1XhLcQkgh0ua/pJtzs
	dSmlgPLXMVIbRaTri61cISl4kZh0LHdI=
X-Received: by 2002:a05:690c:6f02:b0:796:37bb:9eb1 with SMTP id
 00721157ae682-7990a8ce666mr69440887b3.29.1773234112878; Wed, 11 Mar 2026
 06:01:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
In-Reply-To: <20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Mar 2026 14:01:41 +0100
X-Gmail-Original-Message-ID: <CAD++jL=P+0nY3yVM9MCrRfG5xLtg=R6Xgpi1xrbzzLPD-Y8KKQ@mail.gmail.com>
X-Gm-Features: AaiRm53di8hZ7D-oR6Q7wA5Pyxd8PUFmpi5mGlcqDizSLxmOe_2ndnsU2oyjceM
Message-ID: <CAD++jL=P+0nY3yVM9MCrRfG5xLtg=R6Xgpi1xrbzzLPD-Y8KKQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] Add minimal boot support for Qualcomm IPQ5210
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Konrad Dybcio <konradybcio@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Robert Marko <robimarko@gmail.com>, 
	Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 8FF7B2640EE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33130-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,pengutronix.de,linaro.org,gmail.com,gurudas.dev,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Kathiravan,

thanks for your patches!

On Wed, Mar 11, 2026 at 10:45=E2=80=AFAM Kathiravan Thirumoorthy
<kathiravan.thirumoorthy@oss.qualcomm.com> wrote:

>       dt-bindings: pinctrl: qcom: add IPQ5210 pinctrl
>       pinctrl: qcom: Introduce IPQ5210 TLMM driver

Can you send these two separately?

It seems I can just apply them to the pinctrl tree after review,
no dependency on the other patches, right?

Yours,
Linus Walleij

