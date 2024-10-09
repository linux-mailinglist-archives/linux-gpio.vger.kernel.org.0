Return-Path: <linux-gpio+bounces-11112-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F24997155
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 18:27:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 282E5281F4E
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 16:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B791F893F;
	Wed,  9 Oct 2024 16:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DTEgIvsA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62661F4FC2
	for <linux-gpio@vger.kernel.org>; Wed,  9 Oct 2024 16:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728490670; cv=none; b=PxuddlROiMoWPnN8xpo/kcUiV2VntaL6Fn4DtHqFlul+mgvnzj2bhCSE7IZwX4M6HH4+hViHcEYFa0OSJ/CbhKuOjBWedhvRZvfgS8M6Xr6eisDVmvzjpJp299rfNarZF6Z2hG1cMJ8ijwqrsRdKLE9Xf5NlTaDflWzY8Z1TmQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728490670; c=relaxed/simple;
	bh=XsCqJPOQJaKQv6y7Js2/0JYlyxdvkv/RsvJw/wD4z80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UcOkTo2vW34l1d6LF2mThGTIFG4C3Eupv1byJA6qkRCVBxdEoiAjR//Bd0owgxEvemHYCOT8NSpWIbXGzIDEv1pzGYE0hBdmaBFTE+LSm82hNOM5/g0eF0/C105PnN/D4tSo6UcONdBZQTE34PHqAiP0ceY0GUVXgwriL68Zon8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DTEgIvsA; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e263920b6bbso5811178276.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2024 09:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728490668; x=1729095468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XsCqJPOQJaKQv6y7Js2/0JYlyxdvkv/RsvJw/wD4z80=;
        b=DTEgIvsAjvxBspGidQ/ySLJjkMt5QEpqWIj8/h4qQ1q++2Pkbymr3Y3Yu5eoEYW6b4
         kPgJxdi26hYQ8xodCBFZ/pAtfdNBeGf7hFhxBnY9h+wCz4kqcGxghZ+663boh2gHlElW
         mnMw8p2+xOxmv0H0vCE3p9SRp7st8flA7l1Ye9OeemtU2M9R6aaQT6oy++0iN0mMEjtt
         MwiPWh3qabiSgaFvEraURBU7wwodg4vMQnPNAG8yvklMddml25rSB2gMYgsZY1y6lea9
         Mr4FfLFpqHkuLzL5RfE+pN4CbmPgZQtcMyX+CggI4kuPOfG48NDd2XsBA/FLCne1mGjp
         6Z4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728490668; x=1729095468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XsCqJPOQJaKQv6y7Js2/0JYlyxdvkv/RsvJw/wD4z80=;
        b=fgI2PnR3CSqnm9UuWU/kZ0nJwhmIlSQ9v1D3npcRtqXCQVJwQSNKD0zcUxY91KsNjX
         XOrOmNCybGKOmeevnP3UYgtPeUspsSafLO96DOLGUSc1bi76eaEjCta48N8TKTlHG2cO
         roR+iEa1AoeLUSlAD28UJv20Qee/+aVEMmk5FybNQN4Wba/jPyT7yastT7mnNWgjtgJf
         jJ0dwwwwuJu1tG+WBZCXiapZ+VgB+8BdidlKz1RxgVeGX7x3UIi2EQQVfpInRNp/sG9A
         XmScse9UHOFvdwDcATuHPF25+SLOSNK6tQBXgB6t9aL0HrnoDlniRon6csaoHL+Mf2Pn
         cQ4w==
X-Forwarded-Encrypted: i=1; AJvYcCWFv4NEvULosFx1qCMb6TV9UvEznupy1s8/DWAN+rfRhQ4Q0ifGKRCWBO01Nni45VbCfzIgwfCWXHRt@vger.kernel.org
X-Gm-Message-State: AOJu0YyLtW0ZIP5aYZEmVPc39jX0LpNGJ000hlbGBHnH5tpDp29LeQWY
	85ULARl1B7sLw5lIOqeV3ocdZ4SyLpEwvkuDcg7fwqYIPNLtKeXkLEH5l9QjQFusTvXA8SWdbMD
	seXJCmG662gtEeI1+emX2j116ueOQeoUfVJ9ZpQ==
X-Google-Smtp-Source: AGHT+IEhc4X5nJH7MxXrAXKISCQ0c1nXP+Dase0RooHZuKgw/ZrA+HPP70H1m4gm8R9ZIUWIimLj3y/pq23btFkwfJY=
X-Received: by 2002:a05:6902:140d:b0:e28:f172:976b with SMTP id
 3f1490d57ef6-e28fe3d18bemr2644772276.8.1728490667542; Wed, 09 Oct 2024
 09:17:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241002135920.3647322-1-andrei.stefanescu@oss.nxp.com>
 <20241002135920.3647322-2-andrei.stefanescu@oss.nxp.com> <b80873cb-432c-45f3-8f65-41af607af4c2@oss.nxp.com>
In-Reply-To: <b80873cb-432c-45f3-8f65-41af607af4c2@oss.nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Oct 2024 18:17:35 +0200
Message-ID: <CACRpkdZf0jSExrs9=E7dcxm_WAUGHsZE6gNTVeyEaAbGmF8-sw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] pinctrl: s32: add missing pins definitions
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ghennadi Procopciuc <Ghennadi.Procopciuc@oss.nxp.com>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	NXP S32 Linux Team <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Enric Balletbo <eballetb@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 3:25=E2=80=AFPM Andrei Stefanescu
<andrei.stefanescu@oss.nxp.com> wrote:

> I would like to drop patches 2 and 3 from this patch series
> and keep only this first one. Should I send a v3 that only
> has this patch?

No need for that, I just applied it :)

Yours,
Linus Walleij

