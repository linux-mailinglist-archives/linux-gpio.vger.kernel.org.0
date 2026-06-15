Return-Path: <linux-gpio+bounces-38485-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gc9jMK7uL2oVJQUAu9opvQ
	(envelope-from <linux-gpio+bounces-38485-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 14:23:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1673E68626F
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 14:23:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Yjmew9QS;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38485-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38485-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93D063086624
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 12:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FDC23E8340;
	Mon, 15 Jun 2026 12:19:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DE23E6DC3
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 12:19:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525968; cv=none; b=H+wb2F6GYqgKiuu2+WrgQYNXFyLP6vG4nKoxP3WgLmDEk9YDoTihbf+eFQUqomaSSFk3zRuejuXf659Teer6tQ0fUYMOepz7BpJp4rYmQ/WvPqtMhC5GjQk/RmB0OUWfgfZrOY572ylbq65AY4ju7u0KVtOcD9m61MX+s/YRiVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525968; c=relaxed/simple;
	bh=fBO2hJf4+rPrkOp74SVXocT1M+hIBpxOon9pkP770BM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bgas9IF4D0P48j99Bo7Ype59TLAOVNjSiEiuVPwpg8m/eeO1CwCAv9PVvQePjJnXhoZmD7wn35pdt1OK5nuOidmDcqArAXKan4Li6SqG//FekLDmM316yVIIQS1eJBDBel7UMlrCF7MB1r2ZaSxEh4TiYh+26GhOWshjd7MOWl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yjmew9QS; arc=none smtp.client-ip=209.85.160.172
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5178a42caa3so34152401cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 05:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781525966; x=1782130766; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4ZBzvTGg5RXWxT981zetPvdIqY02XPOz3n0/R5VS1+w=;
        b=Yjmew9QSovj+Gv8k1T854IGf/12+JinUw11DK6RSF7W9n4aCMc/YwA1tYGlKcItWvE
         AbU72v7UHCxAW3snmUXOmRdayDtgTUppa7hLGOBo6bxv39Hd4aNnZu32x3+1THuwWubD
         0jUt79H6VTs0fx9SciXc3Qi9NxSyO8YOviBF/a0T0oXHwNFkDeyi5MCG/lHIlXvqdNW2
         /bAbqGiZqTBSBZB/EC8h+KoW3pOi6KfP90wSVoGOt3HVdY83ogkBwVJ8IYTeeNFeKJyf
         zwtSrYrUrgSL9b9sZiQxuKn9glvOEZWtCCacxTx8A7Lm/w3E9p2tuhsOJ+J9/dPZ/Sht
         7Dsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525966; x=1782130766;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZBzvTGg5RXWxT981zetPvdIqY02XPOz3n0/R5VS1+w=;
        b=Q9MgjmLDWSIReuke2HY1LWoFQDFZYOw8gdMfFaJddgl8bpf0EVxDNlD8KONdAedxM/
         7sf5sxSDet80pDPPBka+JLA8HPj2LT/3V65neyHiW8pp4RRnxK5TJshSoeZK9LYvVMTP
         ZDI7naNLe8mff5mI+UHBqZP+PPIb1jZV7/60SkAdmsu7F8tDweB5gaKDOqtFxIzwMgxE
         nCk1Ku3/ybtFbxSbQw/UQWXskit44VJ2lCcWUiccQslWWAxu457p85iQ7+o7yyX+T2Ya
         RXtnksPIXNeCABIr6l8K/7eaQV7BT9nPtxGfVW9GzgDOfUy/TOQC1zk7u+mW+thhxHWK
         +AsQ==
X-Forwarded-Encrypted: i=1; AFNElJ9RW1vjCJ0TjLOWz+yQR5XYKt0RoG2jw3l7lkTK0KcfF5esS4tm02DrLHMUntjqL+NZfI4LhHlAKxEB@vger.kernel.org
X-Gm-Message-State: AOJu0YzvPEVKoWBE+BWUckWsoHA9qGwhQYUs7IS11dazIajc+x1PFeeN
	JCelzsf4NBsQczqkgFiGSwgcZpRnDMO+VIxVMYbodfMK08nHehj/1/I0
X-Gm-Gg: Acq92OF5WS1yKchiaYuqH/GfRtrWCmt5rD8XE5fOJBujLGCEFiEy6Iem0Ce8FTCNZ4X
	j/eQzG9ARjEltvKJpujZ8iWnaXKwj9fLrSrXPHnfSzAW0nmY/GHhxdx6v4iD/+3XdaV38S3bZuN
	0PnDXFfeFO/VeZGQ3qopcN9is/Jl8otWuCGE9rCtHeKodHuYNIv+xMksI5fUBE0tvkJmjABJH+o
	YIduRhyt0FeH/LiAjPQFQRYXQTGr+cUy5G2AoZcGZrkQ9IpIIb3KcAlZ3112RWe9P/i7/JWVLof
	FuxmmmOV8nv5Vhcnr2JTNeberslDsv1QR1bQy1CkLjdgZLYMB8QcnckHab+eILPWETQd2dNzlae
	UAAAsHs329Gpm7tAJibKET/FnxLtpQGjRXv3ESSkCG7oc54+xWEC9lbA0AfNN9F/Tfrp7OjA0Ru
	4gW5xpUDoSkwkZRSv1EIjp8slFF3A=
X-Received: by 2002:a05:622a:1819:b0:517:5bc6:b575 with SMTP id d75a77b69052e-517fbc898cfmr190512591cf.4.1781525965791;
        Mon, 15 Jun 2026 05:19:25 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb7a3c4asm106505581cf.14.2026.06.15.05.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:19:24 -0700 (PDT)
Date: Mon, 15 Jun 2026 15:19:18 +0300
From: Dan Carpenter <error27@gmail.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Cc: dumitru.ceclan@analog.com,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	mitrutzceclan@gmail.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org,
	Martin Hecht <Martin.Hecht@avnet.eu>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Cory Keitz <ckeitz@amazon.com>
Subject: Re: [PATCH v13 17/22] media: i2c: maxim-serdes: add MAX96724 driver
Message-ID: <ai_txjwLPHsSKsJI@stanley.mountain>
References: <20260604-gmsl2-3_serdes-v13-0-9d8a4919983b@analog.com>
 <20260604-gmsl2-3_serdes-v13-17-9d8a4919983b@analog.com>
 <20260610144242.GF2948@ragnatech.se>
 <ail9bHXL_NV2DZK5@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ail9bHXL_NV2DZK5@stanley.mountain>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38485-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[error27@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund@ragnatech.se,m:dumitru.ceclan@analog.com,m:tomi.valkeinen+renesas@ideasonboard.com,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:julien.massot@collabora.com,m:robh@kernel.org,m:gregkh@linuxfoundation.org,m:mitrutzceclan@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:Martin.Hecht@avnet.eu,m:demonsingur@gmail.com,m:ckeitz@amazon.com,m:tomi.valkeinen@ideasonboard.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[analog.com,ideasonboard.com,kernel.org,linux.intel.com,collabora.com,linuxfoundation.org,gmail.com,vger.kernel.org,lists.linux.dev,avnet.eu,amazon.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1673E68626F

On Wed, Jun 10, 2026 at 06:06:20PM +0300, Dan Carpenter wrote:
> On Wed, Jun 10, 2026 at 04:42:42PM +0200, Niklas Söderlund wrote:
> > Hi,
> > 
> > Thanks for your work.
> > 
> > This patch gives me new compiler warnings, can they be avoided?
> > 
> >   .../max96724.c:402 max96724_log_phy_status() warn: subtract is higher precedence than shift
> >   .../max96724.c:409 max96724_log_phy_status() warn: subtract is higher precedence than shift
> >   .../max96724.c:588 max96724_init_phy() warn: subtract is higher precedence than shift
> >   .../max96724.c:756 max96724_set_pipe_remap() warn: subtract is higher precedence than shift
> >   .../max96724.c:796 max96724_set_pipe_phy() warn: subtract is higher precedence than shift
> >   .../max96724.c:818 max96724_set_pipe_stream_id() warn: subtract is higher precedence than shift
> >   .../max96724.c:830 max96724_set_pipe_link() warn: subtract is higher precedence than shift
> >   .../max96724.c:942 max96724_set_link_version() warn: subtract is higher precedence than shift
> > 
> 
> These are Smatch warnings.  I appologize for them.  I know about them
> but I haven't looked at them.  I'll fix them by the end of the week.

I've pushed a fix for these to the devel branch of Smatch.

regards,
dan carpenter


