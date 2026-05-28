Return-Path: <linux-gpio+bounces-37622-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAg+Fc36F2oWXwgAu9opvQ
	(envelope-from <linux-gpio+bounces-37622-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 10:20:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 068625EE75D
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 10:20:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7514B30EF677
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 08:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0B7D371876;
	Thu, 28 May 2026 08:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="heBJg1aT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C160D37105D;
	Thu, 28 May 2026 08:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779956156; cv=none; b=FO68t8AbZVZ8okB+VTMLhDysRvM0yERqZtZhuaOYLcuTnZdzYhJX6fuGekVE1i0yfe2Ecz2RD4RrT2aHvNJVHgccQxDmP35bfz4SoyZ2sJToRDIq8PB8tpLuDGTxUGQtRCu4401oypEX/jyHSdZ32gVpJ/C2lIkvpBLChYGzJx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779956156; c=relaxed/simple;
	bh=CsRBzO1C9HKLok/z92l+HkbLBc5aAnJpTikn3B35gwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mwyueudTXfCV2qwqtEijUsfTNeIIGdB7ftf8PmZPoy4wBvlUdjlxd0u2Saee3hIw91ibUXyJm0f3weXwGEpfLas0516rngc27SNG1iOPdP38eJ+u2Ox5u1eEXdO9WEO0Sa4AykRXSIiFx3V95XTHtSQRtoUkcbzo6/hty58aYCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=heBJg1aT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365E21F000E9;
	Thu, 28 May 2026 08:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779956153;
	bh=pF+ATDTNLNCvOuepEvw5aNyLPxjD0A62AdGjOKIXEUU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=heBJg1aTYzyzSvHaCnRyeQuR5gtw5IP7dXxiPWHfjc1L4nph8pJmvYqTNzWJPeaRM
	 au3C8+If04+cesVYZc3CUvqGgCYnfoHH4npxZqs9MkUDw8Gh+8LyKRsSX9rahifzFc
	 yWtqExvPRdME1/bJfE9mpL+bjQVWr0kLD5uojHwEBv0HeBdmokJnQudZm3Ya024qCF
	 PxI0b/Aal2QwK1gtVZQhJjLy5myAx2QR3zt1PlS5HM7wXGLhuh8tbdIiLWW39MYvYF
	 enFXqRydqjVWCMcKd/utLfvZlSxmk5kSGtc4tefkNKYbejg3eRUrlQsCrU9Jzjz//6
	 aFpTQsRHNAXog==
Message-ID: <a3cfd3dd-05cc-4131-8f03-3a4cae445e6e@kernel.org>
Date: Thu, 28 May 2026 11:15:47 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] pinctrl: renesas: rzg2l: Add support for RZ/G3S
 I3C
To: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: claudiu.beznea@tuxon.dev, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260528080439.615958-1-claudiu.beznea@kernel.org>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <20260528080439.615958-1-claudiu.beznea@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com,bp.renesas.com,sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37622-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: 068625EE75D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

+ Wolfram

On 5/28/26 11:04, Claudiu Beznea wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Hi,
> 
> Series adds pinctrl support for the I3C on Renesas RZ/G3S SoC. For a
> clean I3C support, cleanup patches for the pinctrl driver were also
> included.
> 
> Thank you,
> Claudiu
> 
> Changes in v2:
> - collected tags
> - dropped patches for configuring I3C standby
> 
> Claudiu Beznea (7):
>    pinctrl: renesas: rzg2l: Generalize the power source code
>    pinctrl: renesas: rzg2l: Drop defines present in struct rzg2l_hwcfg
>    pinctrl: renesas: rzg2l: Keep member documentation aligned
>    pinctrl: renesas: rzg2l: Use tab instead of spaces
>    dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document the missing I3C
>      power source option
>    pinctrl: renesas: rzg2l: Add RZ/G3S support for selecting the I3C
>      power source
>    arm64: dts: renesas: rzg3s-smarc-som: Enable I3C
> 
>   .../pinctrl/renesas,rzg2l-pinctrl.yaml        |   2 +-
>   .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |  18 ++
>   .../boot/dts/renesas/rzg3s-smarc-switches.h   |   4 +
>   drivers/pinctrl/renesas/pinctrl-rzg2l.c       | 260 +++++++++++++-----
>   4 files changed, 207 insertions(+), 77 deletions(-)
> 

-- 
Thank you,
Claudiu


