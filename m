Return-Path: <linux-gpio+bounces-39428-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3mDiLtUjSGoHmwAAu9opvQ
	(envelope-from <linux-gpio+bounces-39428-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 23:04:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0910D705ACB
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 23:04:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=mVPZG9WZ;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39428-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39428-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9D7E30305C0
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 21:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD0230C164;
	Fri,  3 Jul 2026 21:04:18 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D602877F7
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 21:04:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783112658; cv=none; b=adpJPKcOjFLFPNS1cjlYRPU1AMtgbAavlCjKDlU9CU0kRctGFTFgImkT8C2P6RQ4rZYCmZ9qhc3oLgWme3Vt3BbZoPjJWZr88P+kAywlTC8jrl+Q1OC7wUyotBnIktFY84gaD4FbWT99WlXHgPtuBwBvFY0TBkRLhC2DJqW174M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783112658; c=relaxed/simple;
	bh=057Zy9OBNEVAmmErkRANAIhVeUwl/UkARFKpq+4xQ5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ri+IaEWpGwmMt0Zzr0g/DAR+WYECuNwIlto010DiXJlXeonZED1lEicnLxpmK6t3J4H7QQ4Bs10X0O743/AEURTMalzhV9M1QWdfAiLFFzEWgQcO11NPHNy5+XFiFJe5aa26m8UkBRfUv/B+EQHlyvm1n4MEOTXua+UySMcal+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVPZG9WZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 129B91F00A3E
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 21:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783112657;
	bh=057Zy9OBNEVAmmErkRANAIhVeUwl/UkARFKpq+4xQ5c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=mVPZG9WZWetiuUBQBQcNKKAVmZqIdOPlkulglymkdujUkySjI5GzGt05vOJ0HuIK/
	 h8WmGozV76kUvSzOPgDE0V7wzFDe/RKMOLQ10Jc37DosdcnEBPUoLl0javX5eRWm5k
	 I44FfYvnvOwVUzBDxeRTTUu12IqYD3IDOyAPZtIMURyInQ3WipdncvIa3gDpKMduQ1
	 TTHD5E3Xw8bRMgXmr9DYligCt/h3E03ZAubyHVZmJIgsjZyx3ZXYvR7VJOlRqXnI8x
	 2uRKThWhM5rz4YZuAbefx1vfNCuD02NZob/JzwXuvzj8Z/YN1GWkBTUWl1NvvNJ0tm
	 te6KdL94iPkww==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeae350e0aso844478e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 14:04:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqXAvYPzxm62xNUjZDWKiqicF65CUMgaI0+DKPdzKXe7jCX1+0Gc2UbtcmZtHSD3w+hVNc5KneRzlUm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7pEydSs5QLd8sazHwbI6/9s/G6W8vds/72an7lxkhLdS7dbw2
	C6UPF3vnE/De+0+6V2jFCU36VBrHZIPnU0h/ndHoCPk+4fHp9IkGuTV2b6cJ9579T0k+0EZBGeE
	Hfti7wwPpQqXLuoxo0EA48T8g8H+Z6UM=
X-Received: by 2002:a05:6512:244:b0:5ae:b764:3ba5 with SMTP id
 2adb3069b0e04-5aed50bf5cbmr58705e87.64.1783112655874; Fri, 03 Jul 2026
 14:04:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703073029.2588960-1-ravi.hothi@oss.qualcomm.com>
In-Reply-To: <20260703073029.2588960-1-ravi.hothi@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 3 Jul 2026 23:04:03 +0200
X-Gmail-Original-Message-ID: <CAD++jLnmyZauNi11xdPYUXZMA+X_Ztg6TNxkKrK+ATZTP=W7_w@mail.gmail.com>
X-Gm-Features: AVVi8CfrQpkfG73YJB3yBFkLAI4xFHb3eiNzbFOQ7XgJ7pxmuRx31N4Mgw7eoz4
Message-ID: <CAD++jLnmyZauNi11xdPYUXZMA+X_Ztg6TNxkKrK+ATZTP=W7_w@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] pinctrl: qcom: Add Eliza LPASS LPI support
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com, 
	ajay.nandam@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39428-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ravi.hothi@oss.qualcomm.com,m:brgl@kernel.org,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0910D705ACB

Hi Ravi,

we are in a bit of maintainer transition for Qcom stuff,
Bartosz will apply and coordinate qcom pin control
patches!

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

