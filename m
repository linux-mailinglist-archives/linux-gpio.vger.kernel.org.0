Return-Path: <linux-gpio+bounces-37358-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFMKFNc9EGrzVAYAu9opvQ
	(envelope-from <linux-gpio+bounces-37358-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 13:28:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B6A5B2FE0
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 13:28:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F9BE30237E2
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2026 11:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313563DE43F;
	Fri, 22 May 2026 11:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="QxTAp/nY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E743B6348;
	Fri, 22 May 2026 11:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779449278; cv=none; b=mEkhQAMsQtOUC7Hp9OD+q3wMqNKYp9V+QTld0ZwsJbw6jPlkFS2L8bzCyugf29M+eXF78Bf85UuRRLzPObDp9ZijnmhuMH2YIXWfn/AIz1M+ZgpTnM2kYaCFZk4AtRmvwW9fZfE1sXbQg2Wdl9cBMsyuSjBIi2avYoGL17qMSyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779449278; c=relaxed/simple;
	bh=4q/myfyVbmEyFIe6+941BMQwtch6h4nWsms2RIJ1+Dg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=MDmsyjm51ZXyQHFkQV0NsQpCpaq/pVBfIdmNrC93E54n5pGFzHNWhbrkf3pMQqbpGiXt4BKlizoZQg00xK9hChrLgK0kobqFGnInejyxOP6ATcMTRsEtmsyeLMgUIiavayGfF7lKgn6qq38VzYZ2yt8MrZcZ3IrzzDflYkBJLNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=QxTAp/nY; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1779449215;
	bh=4q/myfyVbmEyFIe6+941BMQwtch6h4nWsms2RIJ1+Dg=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=QxTAp/nYGkFn70NXFt9qnYBm0HJGxNToTXspAhX4OI6OYl/GpLOinjUCVZCq5pxSr
	 2b91As0ZZKM3i2DddJARbmciZ/2l+rqvMrkh+T6wWSxKyV8FHpGgCz4oi3wCp7vPxS
	 +wAM0K8UUz03UHmoXLrcS5qWQJzoGYb3ZYcxFkl4=
X-QQ-mid: esmtpsz19t1779449213t87449ebb
X-QQ-Originating-IP: VyEj+Nv6piyvhL1JE5iTrnptQpzwWFWaLaZ/u8HF/Ko=
Received: from = ( [210.3.135.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 22 May 2026 19:26:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2874474236348965011
EX-QQ-RecipientCnt: 9
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 May 2026 19:26:49 +0800
Message-Id: <DIP63LFPHYTN.XDUDRDCPPZVQ@linux.spacemit.com>
Cc: "Conor Dooley" <conor.dooley@microchip.com>, "Yixun Lan"
 <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 4/4] pinctrl: spacemit: move over to generic pinmux
 dt_node_to_map implementation
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Conor Dooley" <conor@kernel.org>, "Linus Walleij" <linusw@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260519-germinate-ageless-631033d22797@spud>
 <20260519-cosmetics-careless-0e9a219c51ef@spud>
In-Reply-To: <20260519-cosmetics-careless-0e9a219c51ef@spud>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OeNW/oXGg/KmjwL+9YmKXZqjKPh0QCz9xdXXjE8pMpmVCwodNzNHiU8O
	7PgIgzgY3jbf9iIQ5uX+nkdKBriUW9ejZYeXWECZdJdugVngRjCLpqWXV6mbDlfs+7nuxZQ
	ztkn4Hz7n20Tmfc8GJMvfRQg6PFOm0N4jbVF3Eg/MWaSFmFfhpXb+XzKbJkiVyLVrya6eBQ
	JJw1PuSZlXZnR0VSiSmoy0zGrpkfQ3sXB/1FOv2emo4xZLQivI41pGJ31rWjUt+YGEO+/QG
	W0QjwvvRZRMkqxrQVjdjdXAWtv1KIfGOWhkXd0NsVzmDcucRDE62XxAS3QyCzd9fnCF3Pdz
	3n7TcIpHqHsf1TcGpMqSNhAJPtJSSuqwA1+igLWSYwqSSyTwVFuaD7XYIvgrg1A0Ke80xb1
	EjrhXGn5dD/jbt2Km1a6+2OROL/zKtej6R+aj37ZJb704aegCxvgfjR6DLQJgMVsYyw3wsZ
	6S+KukFcAaPngGMAlPTJirIH6Wt+T5prfx4HIFJ+kxG0tHMQylfuM1M89YoSQBDWd1cqQHB
	CLG12hwdmSclaJt6gYppfiSAEO2ReTLYaHvOEHM7/kAm2aY1K8PTsjdAK8Pu5V3RdrdEKGU
	QHjTFDcqNlxGQ0WRT6fv1/yUk68U2ZMpvNoxfAtbKbd4/mE6AMDGQkXZ+tQXxEP6h56ei6e
	STRhlAK2k4QnNaoCzMztSWn1WiALiTzCgzEMw+vH+Yv8eFdPE/+KLy6eCJaApWmVJj4jJX/
	aSwvAWK1qIonvP8Gnjq8HaYpxJAyLik9O1HLX8S1ba65WGXHnM2Xp8X7FVnEbZwR4DYhipD
	7Q2PBw7UCUliw361F/DMU6o6bvimlM9VabV0wmyZxDcJz3yiua3lbfnboQFVH+JrfdT4IRx
	6VyJmIKigyMlAmMK44uvHWtNueq8P6HSP8XIfhoYTfNNfjyXge3pu/A/zCeMA+qv7K3BfmZ
	638QHiabeIC5Vz/l56LRmpkdtL/0ebPMXquMS1ug6yNGceBdmYjkiwios27C7RO0llkLWwg
	n0/0IJ26lCq/+ym+ZeyLp6SleQNssahLue7ylGPsxpJ6kRnCnTmOOt4tjzMwu7wZXPONnIq
	TVugy4Zvdlu
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linux.spacemit.com:s=mxsw2412];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37358-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[spacemit.com];
	DKIM_TRACE(0.00)[linux.spacemit.com:+];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[troy.mitchell@linux.spacemit.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.991];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.spacemit.com:mid,linux.spacemit.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,microchip.com:email,spacemit.com:email]
X-Rspamd-Queue-Id: D2B6A5B2FE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue May 19, 2026 at 5:37 PM CST, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Replace the custom implementation of dt_node_to_map with
> pinctrl_generic_dt_node_to_map() to demonstrate its use.
> spacemit_pin_mux_config didn't provide much value in the first place,
> because the group contains the information required to look up the
> spacemit_pin struct corresponding to a pin, so there's no loss in
> functionality as a result of the generic function carrying only the mux
> data in the group's data pointer rather than having an array of
> spacemit_pin_mux_config structs.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

