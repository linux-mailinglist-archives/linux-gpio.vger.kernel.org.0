Return-Path: <linux-gpio+bounces-35984-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKLRFFUq9mksSwIAu9opvQ
	(envelope-from <linux-gpio+bounces-35984-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 02 May 2026 18:46:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1678A4B2DE6
	for <lists+linux-gpio@lfdr.de>; Sat, 02 May 2026 18:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E1E8300D15F
	for <lists+linux-gpio@lfdr.de>; Sat,  2 May 2026 16:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35EB3859D2;
	Sat,  2 May 2026 16:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mM0VFItv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C31540DFB4;
	Sat,  2 May 2026 16:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777740363; cv=none; b=lWr6H436E2CfIvDkCsJyp3h8EbjTT09gxpk5/T7WZGdBtPruivaoFWWiAa8cAr2Iew2CWjk1ZTAX+qIxIP8+5QJzYubLtDc8zIuB3k67Ab0nsj/B3K/9tC7iPfCJ1VTKawmSIE3/aQuneKDoCL08KidMxgOOc3UF4iPtrr8KGP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777740363; c=relaxed/simple;
	bh=s93VJCDBnvDfrecPRtxHRCkkBez6Fz+HZPYqWbqIAkw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R9mKTvcdvy79jBM8bB6wSd2YxNEE02/pBH6BvO8hgidAcutpl8kUgB1Bo+pMcrwi2LZIWJ101cnbDHyV59ZGp/8yFclg171/joZkCDeq54NcZ9KNvmpBppKK/XLjY+TaAkYPXsoRtPCGcaP/Mhx3GG2/mpUVGVDpxtmbZxSe8M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mM0VFItv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB58BC19425;
	Sat,  2 May 2026 16:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777740362;
	bh=s93VJCDBnvDfrecPRtxHRCkkBez6Fz+HZPYqWbqIAkw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mM0VFItvv0NwJhTS9Qka9pD2gQhdVDRZNLnEudvHavHJW8PcHO1CMmyYOlFMYXz72
	 bW8edgGGN9KR5w5kt2QryXHza2K+FphEN+EM4T8tSbNtE1HSOOLzrc+jJPFnNtUhQH
	 4ixpGPO2jxLUANqnBRaPcgA9a/zpzuEzU0fK4wBgHb1zgFflgV4MpWUzVefa1ssRrX
	 CS6kp8LDHcZKBTHfy+4rpnDCnoXki8a045qnr45cxJxAIf4sLzfCgohbieuv3ChkTE
	 9eHKCPBEQfvlwA6xypbDE/fQa1CJkU9UugGOdptKEvZovhqrc4dn+cQaaQfD3cOpTE
	 IR1LR8d3C7y9Q==
Date: Sat, 2 May 2026 09:45:59 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linusw@kernel.org, brgl@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, daniel@riscstar.com,
 mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com,
 chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com,
 john.fastabend@gmail.com, julianbraha@gmail.com, livelycarpet87@gmail.com,
 matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 11/12] misc: tc956x_pci: add TC956x/QPS615
 support
Message-ID: <20260502094559.15c3f479@kernel.org>
In-Reply-To: <20260501155421.3329862-12-elder@riscstar.com>
References: <20260501155421.3329862-1-elder@riscstar.com>
	<20260501155421.3329862-12-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1678A4B2DE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35984-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,redhat.com,bootlin.com,armlinux.org.uk,kernel.org,arndb.de,linuxfoundation.org,riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Fri,  1 May 2026 10:54:19 -0500 Alex Elder wrote:
> The Toshiba TC956x is an Ethernet AVB/TSN bridge,  and is
> essentially a small and highly-specialized SoC.  It implements
> a number of internal functions, including a GPIO controller,
> control registers managing internal reset and clock control
> signals, a PCIe switch and internal endpoint, and mapping
> hardware that translates between PCIe and internal addressing.

drivers/misc/tc956x_pci.c:541:17: error: call to undeclared function 'u32_get_bits'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  541 |         chip->rev_id = u32_get_bits(val, NCID_REV_ID_MASK);
      |                        ^
-- 
pw-bot: cr

