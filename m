Return-Path: <linux-gpio+bounces-35175-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGacL/sM4GmzcAAAu9opvQ
	(envelope-from <linux-gpio+bounces-35175-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2026 00:11:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B6D408747
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2026 00:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E634630B7FB3
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 22:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10AA7381AFD;
	Wed, 15 Apr 2026 22:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kDTw5mAO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C614F2FF657;
	Wed, 15 Apr 2026 22:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776290945; cv=none; b=mIX4dTcr1Af5StbSo0ZxWzvW654Jj4GbEYC4qvD9DDQ/GQUi/E68AyVEWxlkqAMqd4XYipmCX/D/Sz/YBR0ANgCF5o0vAuTTPh3/UoAQRYaErslzV1eY9zs1vhTXULgGCQiuM4bS4BLPSCYQUxg22TnJuF/VdFitK1e9fDFjeYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776290945; c=relaxed/simple;
	bh=w0k1S9PWDZSsF3IjtgouZVXru1PuRKpeEwZNd/z0RDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZE6Hc3VcANKjXCdCT6nyEt1ucYa/A1Ov3Wtqf4Brrkjnli6N8uKApqHykOhUfzvcr7DcoflDYcDMxsov3ZKqHRZ6+e1IF/t9MJ2AgO100FHmSRRXCaBSHeuXNfA+l7s9LeI6NRMc8OBauEzuuHhV65QKoWnFyC+hU336Y71rc74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kDTw5mAO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C68EC2BCB5;
	Wed, 15 Apr 2026 22:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776290945;
	bh=w0k1S9PWDZSsF3IjtgouZVXru1PuRKpeEwZNd/z0RDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kDTw5mAOj6efMmX6LEgIoMfdjqt+7yY/uLy7LNijxprb5rHphW+4eb0g+67XbD2UG
	 vYcc46PgqQFHuwfmHTVGllZqdPCmTPaAPcgybGDQw7kJ1JDhCNthl/ajtbekO0r+QX
	 PvrX/wCPR107B3CedKwYbPaTzm/4kY2ruALzeeUXajTGv2APIRQeZDHZcR9Hnaf4qZ
	 Z2vfji3PYXTS16L2DJFDQoiW+mDd8zECPWTUDDB1JH2ERcSSGou4exXVX+chUvwmRc
	 N21zZZPxmS7wEVqVS676c4W2NWaGRUWCFvV+/4Dl2DgDNmb1CucBgQih6jC7EwjH8t
	 wl7t9GKNxsEiA==
Date: Wed, 15 Apr 2026 17:09:02 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dumitru Ceclan <dumitru.ceclan@analog.com>
Cc: Martin Hecht <Martin.Hecht@avnet.eu>, linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Vivekananda Dayananda <vivekana@amd.com>,
	linux-kernel@vger.kernel.org, mitrutzceclan@gmail.com,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-media@vger.kernel.org,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v10 10/22] dt-bindings: media: i2c: max96712: add
 control-channel-port property
Message-ID: <177629094249.753736.890273374328121727.robh@kernel.org>
References: <20260406-gmsl2-3_serdes-v10-0-645560fedca5@analog.com>
 <20260406-gmsl2-3_serdes-v10-10-645560fedca5@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406-gmsl2-3_serdes-v10-10-645560fedca5@analog.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[avnet.eu,lists.linux.dev,ideasonboard.com,collabora.com,amd.com,vger.kernel.org,gmail.com,analog.com,ragnatech.se,kernel.org,linuxfoundation.org,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-35175-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[analog.com:email,amd.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 47B6D408747
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 06 Apr 2026 23:14:49 +0300, Dumitru Ceclan wrote:
> Add maxim,control-channel-port property to allow platforms choose which
> control-channel port MAX96724 exposes to the upstream I2C host.
> 
> Suggested-by: Vivekananda Dayananda <vivekana@amd.com>
> Signed-off-by: Dumitru Ceclan <dumitru.ceclan@analog.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


