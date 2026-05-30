Return-Path: <linux-gpio+bounces-37719-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCqvGWu/Gmpk8AgAu9opvQ
	(envelope-from <linux-gpio+bounces-37719-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 12:43:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE88160C366
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 12:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45802301A1C4
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 10:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0F2399340;
	Sat, 30 May 2026 10:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fmGKvnQx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867313546C3;
	Sat, 30 May 2026 10:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780137736; cv=none; b=m7PyswVvpXsCyK0VPwp2KcEKIF5Gh82AWqbjCqLSBJIo6V0ihLr9PBXF7dUcCt8S8ATaJy4wZe2V2OjXlRA0sEwCW+fAC94El/hZRGzIoWuTrKQX8lWFeSVBQ5j93v4GVRdoNfJ1eKIWcuagSRRbcfsi4VCK3W0qPcJuyRsDJSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780137736; c=relaxed/simple;
	bh=dIktKfC3Bz+b/KB7wKS3KO8B8OK4sNjn3n2kF9bRjAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ed2OE3tcgh6GbKtZBa3Sd+bkLiH7wsmHTTcRE9Tx4UQGWf6GiRvogFEz7kBRyFdCboG212rZvH5f8y0Po3ZdeqK73FvuK9jsne+Xut5EBNLLWQHerqKqdU7e9z208AtvJ0xOCdaaItCBFY5Jff/uz3LQ1YJbar8suspB/3J9DPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fmGKvnQx; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD7781F00893;
	Sat, 30 May 2026 10:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780137735;
	bh=dIktKfC3Bz+b/KB7wKS3KO8B8OK4sNjn3n2kF9bRjAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fmGKvnQxO6ds2lTqeEQBoUMCoKIUkYVVGc4NcNcf/rtbqQBKiQhMXvXM8Tjn/Wr7W
	 /w9AwSvuEwdnZHYbM5QWCELuK0vc3HNDc/vKqfGmi3UJz0mDmzdOpTkf2h6M+Y6PLJ
	 g7nk+3c4D6ssEh8IPIHIxr0yayRHV0NlN5QX8xpaTzJu60aQoCk25sjsuzHVtoElB4
	 /yuXB0LWLEaLOfNiSe2T4iR/O+1gE/FPYZ1ZRNrS0TwXunf8M64aOGnFX9M2N/ZHVy
	 Fn2OD9FYzoubY7/uYJOeJKwQNpKCowpuMLzYEIKKsapScrPE4pIDb/wacLT/GJ2ciz
	 lDoGIZVPy8PYw==
Date: Sat, 30 May 2026 12:42:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] pinctrl: qcom: Introduce Pinctrl for the upcoming
 Maili SoC
Message-ID: <20260530-primitive-encouraging-quail-ee8af1@quoll>
References: <20260522-maili-pinctrl-v1-0-0a6636f5c277@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260522-maili-pinctrl-v1-0-0a6636f5c277@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37719-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: AE88160C366
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 12:42:07AM -0700, Jingyi Wang wrote:
> Introduce Top Level Mode Multiplexer dt-binding and driver for the
> upcoming Qualcomm Maili SoC.

This is the first patch where such name appears, so same comments as
before for other cases - describe what is Maili somewhere.

Best regards,
Krzysztof


