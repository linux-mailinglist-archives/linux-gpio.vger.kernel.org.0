Return-Path: <linux-gpio+bounces-35022-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULhSBEpt2WmmpggAu9opvQ
	(envelope-from <linux-gpio+bounces-35022-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 23:36:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 885AB3DCF7E
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 23:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 181F8304D5DC
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 21:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91BE33BAD9C;
	Fri, 10 Apr 2026 21:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="bAkLb03z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062C22E62A9
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 21:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775856571; cv=none; b=mXCFA3KseKVoBniSwjEXo9/xujqGvh1D17wgOU8Uu26xt5gsQmdkJz3H2YSkTGBStoQgDhQySYvpxNR1LpLsPadQscDLimA1ysyVc3j6gdE7Vz5GyMZ+/J2FM5SlSzoXXE8IpGwCmDw8rLue3rtTB7U9iU80BczZsZV8SQiZlm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775856571; c=relaxed/simple;
	bh=xJojJ7zXZE3hv9FTrQrIOztWtQat3bt+LI2SjTASCc8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dWkUmUgGMr4AKzo11l5iLAFc8xkGmBSRptCeW+8JQpnoiDorHyMrhylqLGL0+zPKaXSwzHUxzSFS4WBLe0BOGRRIT5u9C5DW6hWM7O0E1Bw6Pz+EZqfeFMTvQxfEccyFvdVEgW0yokhMCtzAym6iSD/Jv/JbR8gJWSL+bp5wW5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=bAkLb03z; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8] (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 805BB74665B;
	Fri, 10 Apr 2026 23:22:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1775856124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D4Zfbjm4MkkPRNcu/lkToxV+ObwGoSvmfiyPV7tjrN4=;
	b=bAkLb03z7VWjwwinayKy0UinK2NeeyXmLjxtVWLWzopQZe/CEqd7MO7MK4lvGQ8TTldQUk
	fcDYkSR6tAgJVvweYLghVtF4Xw99PvAsyR//i3bFXXikpARiUp74Y/f5mMn0ZGFBKIPCtb
	vLqVj7AzirgexJZSyP0MSHpn3+6rBsDF790y5JKogAgATvb8s8T9x0JtgySogkCbMZnz/V
	tsh8XX77wx7Fp82NJjy1u3yA+nZNhRphlQZZJ/d43GA0lin6qCQLIYE1tdQNO/ixtJTHnE
	tLuWWhZtiEo+6+q7y901DBqv7S5sIqlM/bhmuIhlit4jqRfuYOOxIhxS2jpv1g==
Message-ID: <a5e993d2b6c8b57d2057909812ce831877762bd6.camel@svanheule.net>
Subject: Re: [PATCH 3/4] pinctrl: vt8500: Enable compile testing
From: Sander Vanheule <sander@svanheule.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Linus
 Walleij	 <linusw@kernel.org>, Andreas =?ISO-8859-1?Q?F=E4rber?=
 <afaerber@suse.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Jeffery
	 <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Joel
 Stanley	 <joel@jms.id.au>, linux-realtek-soc@lists.infradead.org, James Tai
	 <james.tai@realtek.com>, Yu-Chun Lin <eleanor.lin@realtek.com>
Date: Fri, 10 Apr 2026 23:22:03 +0200
In-Reply-To: <20260410-pinctrl-testing-v1-3-6f708c855867@oss.qualcomm.com>
References: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
	 <20260410-pinctrl-testing-v1-3-6f708c855867@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[svanheule.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[svanheule.net:s=mail1707];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35022-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[svanheule.net:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sander@svanheule.net,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,svanheule.net:dkim,svanheule.net:mid]
X-Rspamd-Queue-Id: 885AB3DCF7E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krzysztof,

On Fri, 2026-04-10 at 15:04 +0200, Krzysztof Kozlowski wrote:
> Enable compile testing for Realtek pin controller drivers for increased

Small nit, but this looks like a copy-paste error from the other patch.

	Realtek -> VIA/Wondermedia (or vt8500, whatever you prefer)

Best,
Sander

