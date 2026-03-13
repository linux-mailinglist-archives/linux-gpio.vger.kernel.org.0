Return-Path: <linux-gpio+bounces-33375-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFtOKbEftGlLhQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33375-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 15:31:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D09D2285055
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 15:31:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C2FF330B0E6B
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 13:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E18396560;
	Fri, 13 Mar 2026 13:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=julien.massot@collabora.com header.b="CeE2mW4J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E9436CDEA;
	Fri, 13 Mar 2026 13:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773410364; cv=pass; b=WGA34SF8PWB25WBkCLK50fUDtbxi5FRUOxW9h5eoYZZR/sn/ecRfsnY0thRjjP74XUukH/DtlMqHq0pucvLg0hxHqmOc3UwKiRvwfAfNRIujKMKLjRkTT08gRJeKf6WSapAGV7h25OZ0If5eS0HANI/KcNXAk1jMBJ2mqLi2L18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773410364; c=relaxed/simple;
	bh=o5d/UeApUdVWt9EXWxgQtMWQzeL4v+2vGK3WxLWgld8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ryS37rXl2xLGf/hHRbE93XXgdySPkgx2a+uGG2elU+RTKadm4vYgD3LFOo5Z5K2XfZZI3MC8MMyTarSU4q1JWK8bKTIElds8UCw+63ALvJdakM6WtA/awPVfd6/aa51DdTt96seIsX8ZSKNOlfDrzpnnY8imrwDHLFUQIn7dI6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=julien.massot@collabora.com header.b=CeE2mW4J; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1773410345; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Y28NfJsNO7n1f+7BR4DuGsYawVMRPPBjiFpZDcZ1XkiRkjf2/VijtkU5D1VSpWpD5KppICJkPDrclbuwEoBmB4P5Euz1arTu3v2HCPio1gmVj35FravjYr5ajyAokxkAW9xxdlf1NIccxhbLR0wnENNKc9IuCgNTe4y4LSJQB24=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773410345; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DGqVqZfCBzZwLC+d969MR82frsxKVw1XiUQtABbeyJo=; 
	b=l5MorecKGSleBzGYc8Dm2YaysK0OebkamypP5IdGx4918Tsj35FywhEzHoSKecWEKxtzm9pFwW4F/kSxr2P0WInhxK73yOjaNwmibL9sE636w+SP7qWdXTt6FARRVJIsKcDec6zuvPxV7+0CFOAZRfrgqbP4DIr9UV2wI/4XTL8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=julien.massot@collabora.com;
	dmarc=pass header.from=<julien.massot@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773410345;
	s=zohomail; d=collabora.com; i=julien.massot@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=DGqVqZfCBzZwLC+d969MR82frsxKVw1XiUQtABbeyJo=;
	b=CeE2mW4Jgx1najhLErnoV74B/sowb/LLp/31L/HN+kpamx/cCXIc3LD2DWUg2WQW
	wEaLesuavouj6LmtuzUDxRG7HPMlkBrjaTm2K+4sMSzvhoh3BqqHKq9AD7HxFU4z7cE
	Z9XER7AhaCOHzUT41ut7Hv7zGibJCTHvUojTAGQk=
Received: by mx.zohomail.com with SMTPS id 1773410343004432.7248741034314;
	Fri, 13 Mar 2026 06:59:03 -0700 (PDT)
Message-ID: <17790b94-af44-45b1-b5e0-a164605d4468@collabora.com>
Date: Fri, 13 Mar 2026 14:58:57 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 21/21] media: i2c: remove MAX96714 driver
To: dumitru.ceclan@analog.com,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>
Cc: mitrutzceclan@gmail.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Martin Hecht <Martin.Hecht@avnet.eu>, Cosmin Tanislav <demonsingur@gmail.com>
References: <20260311-gmsl2-3_serdes-v9-0-41499f09004f@analog.com>
 <20260311-gmsl2-3_serdes-v9-21-41499f09004f@analog.com>
Content-Language: en-US
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <20260311-gmsl2-3_serdes-v9-21-41499f09004f@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33375-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.linux.dev,ragnatech.se,avnet.eu];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julien.massot@collabora.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:email,collabora.com:mid]
X-Rspamd-Queue-Id: D09D2285055
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 3/11/26 8:17 AM, Dumitru Ceclan via B4 Relay wrote:
> From: Cosmin Tanislav <demonsingur@gmail.com>
> 
> Remove the MAX96714 driver. Its functionality has been moved to the
> MAX9296A driver which makes use of the Maxim GMSL2/3 serializer
> framework.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>

Reviewed-by: Julien Massot <julien.massot@collabora.com>

Regards,
Julien

