Return-Path: <linux-gpio+bounces-39484-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7txUHpHGSmroHQEAu9opvQ
	(envelope-from <linux-gpio+bounces-39484-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 23:03:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8C770B680
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Jul 2026 23:03:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dMyNsLgY;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39484-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39484-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3ACB43009388
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Jul 2026 20:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 357CD3B27F7;
	Sun,  5 Jul 2026 20:58:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27303B14C4;
	Sun,  5 Jul 2026 20:58:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783285100; cv=none; b=Mafw97AYrWuyBQ5V8CiOgtU/hAZMbAgthgN2/dmrvhg9KPWMsWptT3Ce1FW3W1Afnh3HZnS88oP55NnEeOGjUmjmgHcXxkVntoDWr+zQXrRShI5UcCwWgiLBEYgy72h8UZ/teJBWyqAGsojB4fRBGpYXHbXyCDFxG43iYZ/uadg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783285100; c=relaxed/simple;
	bh=mTPgiBX4dVkJ57KaC/YAdzW+b0nCig0nU5t6fVFhkUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QOMppdN1cqGwJtVTEPUvpPbiKK1L5yv8Hzzo3Wt99sivRc53y40/xQyVcZ2G06vkkYwPDmj7g9lkgsRisJ/8+eaAuauPBcml2bFaofwWKcyuRaIxU5x6xhGtHzz+daaAGCYPotf3hIpER/SuiDyJDaqZXcn+SiFeCkEK6m+77WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dMyNsLgY; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7254C1F000E9;
	Sun,  5 Jul 2026 20:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783285098;
	bh=E8Omg9VpqUJQkuh4f6JRLyZJV36bh9EAZ1uJ3toWuNg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dMyNsLgYfQ56xs4xbl0OgHC1t+VzfGeR7yh/FEclnbvh5biuaoMJyB18VD1nweS9r
	 NoHlIr5L3eueua/a9ZPxK6UtUyi/5UmDeKbxEhR/jp78zSKqbOHvyqbVS10372CU/T
	 I/sLskfJGfaKX8EpVDvt8YKQo+5iV+RT7/EJcqUhluw8cmBimSkCLKkvnRu0Xo5Yye
	 cuZ0wLvbu3y6F1fU0LZd/8C1JoZDOMmTT7mebZ/1LdO4aUX6N6vNdPuzxvMPIiqOyF
	 qBZE9h+J3wraWvV2MEdzXS6u3YomnmIC+pu5oyPLanzfuG7iKaSaAy+0728FQhPTss
	 zXBUyk88BnzVg==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Collins <david.collins@oss.qualcomm.com>,
	kamal.wadhwa@oss.qualcomm.com,
	kernel@oss.qualcomm.com
Subject: Re: (subset) [PATCH 0/3] pinctrl: qcom: spmi-gpio: Add pm8010 GPIO support
Date: Sun,  5 Jul 2026 15:57:56 -0500
Message-ID: <178328508287.1157743.556759656826877879.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507-pm8010_gpio-v1-0-3bce9da8d2ba@oss.qualcomm.com>
References: <20260507-pm8010_gpio-v1-0-3bce9da8d2ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:fenglin.wu@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david.collins@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-39484-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AE8C770B680


On Thu, 07 May 2026 22:34:06 -0700, Fenglin Wu wrote:
> Add compatible string for pm8010 GPIO in the binding and driver. Also
> add GPIO device nodes in the existing pm8010*.dtsi files.
> 
> 

Applied, thanks!

[3/3] arm64: dts: qcom: Add gpio device node for pm8010
      commit: 9f41cb88adfe769a87762eff1a7d0d8a2df42560

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

