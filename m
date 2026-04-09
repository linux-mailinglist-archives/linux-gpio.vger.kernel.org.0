Return-Path: <linux-gpio+bounces-34912-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIBXGaFT12kFMggAu9opvQ
	(envelope-from <linux-gpio+bounces-34912-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 09:22:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4E03C6F2C
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 09:22:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 88E44301A43E
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 07:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B0DD379EEF;
	Thu,  9 Apr 2026 07:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OCyo7lfW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF331306486;
	Thu,  9 Apr 2026 07:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775719321; cv=none; b=Xa1Lz9DRC8As8uNPSVo8Mt2rT9kSurT7ILwT17gwIp4dOZjV0qsL68+g69t4GFPfwbtZv6xbcMtaxhyf7xGjFgEm2nFnI66LfL9lNYrKM3UzNPpwK+MGCJW707gKW3Q0PuJE7ZMHjsG/YRzFYBRmx6opYW6mjMLumra7/PjmzNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775719321; c=relaxed/simple;
	bh=sR1EWTGLaX/ISCpGZiXtnYO1BFcp7z46TZPUQhJ0gG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uR4gs42BKYqJYEpHZUrmNSnQmvjElbC/iXMrX57RUU6R+9K/jhVjx1sHN9AQqJNpMb1vLoMzAqa9hXyXSx2N3Pcg0i03oDDHVQNKh0qD4jKB6s+eH/KQOx0lKjDV6ROPBCGdYIFhwZZ6FGozvJoejhULN4VwRf7shHnWNsqgzK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OCyo7lfW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15749C116C6;
	Thu,  9 Apr 2026 07:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775719320;
	bh=sR1EWTGLaX/ISCpGZiXtnYO1BFcp7z46TZPUQhJ0gG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OCyo7lfWZ1nCDqmBX0+MVaERv3ivvpYYYOPqGUs5UikAAEmXqJIYopxbsO497ilCB
	 HSdXL0QrpleFcVW644BJNXuau4NkN1PeOMJHWS5Ua+trKXT684X5F62eoKsErOlmR8
	 OvpJbsNFO6yYwhWItgPX4QXofp+nMPNwUKrVfLK0y8tfuMZGtlplRtQLNkmGHPUXvZ
	 Um+D2RB1XiEF9jPY7jP4wMvfdt00L0XlDl6np0DDD/QgSyNtDFqU/g3/EPOvDWv/YT
	 znXREr5qf3KIcUtQFxHeTGOePHuiWB188J9tm4vQ3sQBvF1WS3yroXIfCFC7AyV94X
	 YwptzOCeOuwhQ==
Date: Thu, 9 Apr 2026 09:21:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shi Hao <i.shihao.999@gmail.com>
Cc: robh@kernel.org, brgl@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rric@kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: gpio: cavium,thunder-8890: Remove DT
 binding
Message-ID: <20260409-gray-aardwark-of-courage-6d94ed@quoll>
References: <20260408093313.17025-1-i.shihao.999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408093313.17025-1-i.shihao.999@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34912-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EF4E03C6F2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 03:03:13PM +0530, Shi Hao wrote:
> Remove the cavium,thunder-8890 GPIO binding as there are no active
> use cases. A previous attempt was made to convert the binding to DT
> schema, but since the binding is unused, remove it instead.

Last sentence is not relevant to Git log/history. Instead useful would
be to tell what made you think that binding is not used, because it is
not obvious - the in kernel driver does not bind via compatible, but PCI.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


