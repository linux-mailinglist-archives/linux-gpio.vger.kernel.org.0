Return-Path: <linux-gpio+bounces-33372-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKTEJMAbtGlLhQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33372-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 15:14:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A59284B27
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 15:14:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F7B630F1537
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 13:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1882E3976A0;
	Fri, 13 Mar 2026 13:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=julien.massot@collabora.com header.b="LVqOhlRG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5210E39B942;
	Fri, 13 Mar 2026 13:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773410207; cv=pass; b=LhkDm5FDRbEA+mTt1NSZx78bV0j6NqZqcVZWtbY/iFmrcJLiPp8I47Wue3BVB+honM4oRF0vSAddevQolRNWilhkVPyNUt2VnAVQC4vaIN2aZQ6I+scmK/K0E11EhY3KqbKFtRbYzsD2AjcczcH7WNK1MLieSXITdKbSHPae+DQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773410207; c=relaxed/simple;
	bh=HjsmSlTudjkbLuVwL87aH81Z8ZZ18KDDRKgScGcmHI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sPNcNtFnzNQWpmAXeJW2EtbtWpLjm5xYhmpPfK2iyBijP5ykoGtVIaYqC7ZR64MJ0okfFLS0dw/8QjuBJn1lSG12XV+LZTEP6O7Ap5p77dDMtabpzoEcnqE7Kc7SlZlaefWt7u3U/1ej2+Pb+ACVzzhEjYlygAqQcf5A8ypBHyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=julien.massot@collabora.com header.b=LVqOhlRG; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1773410182; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PGSQtL0S1p1J7QUbYQ/bGRPcmuepasrPGMm8oLv1z3FcAilWgnFj7cDC5oCb7KLs4V60FLkg2BADdRFvf79ViUeDucEgKxJy4izo5Uu3PPZaAy/PHB1u5HPHebuSyjguYaTrugvw7ImVTaihi+vCwclTznLXA5YLLi+By3NsOhk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773410182; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=j9KwhhH9tgnuzrYFy4kXvSl267IKvRdP8eTatOFy1b0=; 
	b=gxY8FwgRPPFW5DlFxEQT+BScg/sxndreZhlDcyXV7oBh59dYgKNGYPJG7BpxfU+g32j9jwnp3BQ604YdgQoEah+tYifu+nWgQ3dHuqMjR+kimtaTMaBsOxSpuRyP9iWkNs3h5Vg7NYjIP9mfSMNy5JnzRfSnKFwE0+MM/fCg0kc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=julien.massot@collabora.com;
	dmarc=pass header.from=<julien.massot@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773410182;
	s=zohomail; d=collabora.com; i=julien.massot@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=j9KwhhH9tgnuzrYFy4kXvSl267IKvRdP8eTatOFy1b0=;
	b=LVqOhlRGNk3OBOq1QY8w3diEmins97/kIf78dZTFlI8SUOXmeYUf89/1qlqDDSAP
	8YUbPhQw1Tm+iqCFGrcR9HYVG2Vkj0v+lv+7KRLeE5m4U0cpvRONrcq3eZAsdqgAw2d
	ODFTdyKfSJCtuFHlPVS8xIPAi6If3P4+D/D7MjXE=
Received: by mx.zohomail.com with SMTPS id 1773410179396257.8190378456592;
	Fri, 13 Mar 2026 06:56:19 -0700 (PDT)
Message-ID: <c5a4c8e4-dfc9-4fad-9c3a-a767a75850c5@collabora.com>
Date: Fri, 13 Mar 2026 14:56:14 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 20/21] media: i2c: remove MAX96717 driver
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
 <20260311-gmsl2-3_serdes-v9-20-41499f09004f@analog.com>
Content-Language: en-US
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <20260311-gmsl2-3_serdes-v9-20-41499f09004f@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33372-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 22A59284B27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 3/11/26 8:17 AM, Dumitru Ceclan via B4 Relay wrote:
> From: Cosmin Tanislav <demonsingur@gmail.com>
> 
> Remove the MAX96717 driver. Its functionality has been moved to a new
> MAX96717 driver which makes use of the Maxim GMSL2/3 serializer
> framework.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>

The new GMSL2/3 framework is much more complete than the initial 
implementation.
Thanks for your work.

Reviewed-by: Julien Massot <julien.massot@collabora.com>

Regards,
Julien

