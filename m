Return-Path: <linux-gpio+bounces-32704-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YP5IK5tkq2kfcwEAu9opvQ
	(envelope-from <linux-gpio+bounces-32704-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 00:34:51 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 64723228C0F
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 00:34:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 193D6303EE80
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Mar 2026 23:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7B93803E9;
	Fri,  6 Mar 2026 23:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Am2E2Tfx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FDB37F006;
	Fri,  6 Mar 2026 23:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772840088; cv=none; b=H+B9CJPUubSY5Zq+Lr6fG2gvPttlV/vYkQwNDWgEvPwt3YhkTS09DPXY/Tp4LfC1e7iVPe7tr586VprNlo+y6NUxUnTZrZlKis74pp4KBnuRTuQLRo0tT7MAElbxRBSmGEwPwVTTk+l3uLC0q04LbvvjhpTDJZNepqGXXCph4uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772840088; c=relaxed/simple;
	bh=ps3c0d/laThFrETyyg/blSJDPd8l49Uxxq1tTrVn/A0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NZ/4Gkp4R8cT6L1KsNuxUHZiWEH1s9p3stO0A8bbHYbzv5b5+2dROWRo9qCxDeYim1J9Ki/HPdPMATsxhDCyoZGYeA/Q9Frj7UpCo4RfQaIXNIc/IEaBK2Hf2wSm7OUhg+a935nplPx6lR4fyyv/klt4CQA6sq4E9TLR1enkiJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Am2E2Tfx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8068C4CEF7;
	Fri,  6 Mar 2026 23:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772840088;
	bh=ps3c0d/laThFrETyyg/blSJDPd8l49Uxxq1tTrVn/A0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Am2E2TfxaZvtgSNwAErPyzTukgguwCewyDNrd3NpbBq1gD26QfLnLw0papbgCjbys
	 9pCDg2bWpy0hCxugkN/TF4y1Uso5dF+GUlxLNRPIDBoMmL6FslAkGiTnByV9vUUd6l
	 M1ajgoiGEC9GH4s3bi3Jgi6rSBiThDV9wbmGQVpWKANt1smzTj64j9+8ptg1xGfTVc
	 aibUemes++w8Czfb7A5RdJwc54a9+E8C1O0NkhchcjLBCviqSkUnKGU8auqsuNducO
	 9yNeONiZw1v6G298f8wWCH/ezhNyTpi/Jmrs86arT+aAnjymHtME6+cZnzI3eseuxQ
	 JkI4+HvyAVpvA==
Date: Fri, 6 Mar 2026 15:34:46 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jialu Xu <xujialu@vimux.org>
Cc: brgl@kernel.org, kees@kernel.org, krzk@kernel.org, linusw@kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH v3 1/3] nfc: s3fwrn5: convert to gpio descriptors
Message-ID: <20260306153446.66ff0357@kernel.org>
In-Reply-To: <7E5FEA920D0FD172+20260306035909.2447844-3-xujialu@vimux.org>
References: <D5F95320CE72E20A+20260306035539.2443355-2-xujialu@vimux.org>
	<7E5FEA920D0FD172+20260306035909.2447844-3-xujialu@vimux.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 64723228C0F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-32704-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.931];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri,  6 Mar 2026 11:59:09 +0800 Jialu Xu wrote:
> +	phy->common.gpio_fw_wake = devm_gpiod_get(&client->dev, "wake",
> +						   GPIOD_OUT_LOW);

Please make sure continuation line is aligned to after the opening
bracket. There's a few of such issues in this patch.

