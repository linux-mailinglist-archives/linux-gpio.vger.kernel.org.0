Return-Path: <linux-gpio+bounces-34617-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iN5qAQbVzmlNqgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34617-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 22:43:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3AE38E1C4
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Apr 2026 22:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0EEBB3012A95
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2026 20:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDFE736074D;
	Thu,  2 Apr 2026 20:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXiyjDE2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E21B344D8E
	for <linux-gpio@vger.kernel.org>; Thu,  2 Apr 2026 20:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775162621; cv=none; b=Tap0APsdhrVrYLeSJ5lJ7VQHfAkU6k3jpAIpB46Ey2h9gj4PaudWEOBZf+OOAF5U7igYySl0ylE/6xKqb8chTjIK/gLN/AxmOlVEg0quq5KQ1Ip3Y94FgtoyIbmld9v5uRE28PDXuV3sPVeuqGR0yNGCFv7kWztU2ghScdoRgG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775162621; c=relaxed/simple;
	bh=PfOSvF+9Q9GvIApbJuER9HJI0ph9y/C4dHyB4wNs/UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lwIimsbpm3Zbydm7jNkn9QKeMVsWNCd0eS7z4zvNC+PIPw8jqGBcm5GHU/qZwQ+TK4mdDSDL10DPT3iKZyO+ACEgkyf2UN1aG8l/3jWPmiDnX77V4vNY6oBUVF+blS1eqLR3Pt6nAp7UWtjKFw0K5OdFJOhd2H4oMIB3MmHMhoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXiyjDE2; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so2911701eec.1
        for <linux-gpio@vger.kernel.org>; Thu, 02 Apr 2026 13:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775162620; x=1775767420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=21ClTGnhigH6pmJ1bdxGPTsm+cYy8Gt+rk4//h1qZck=;
        b=gXiyjDE23EjXZrk7uxkNcBB90uOw5CiHfWwnqND5xV+ZfXYwOvoki959Actdm7YRIG
         JkGCDOyqQ4vgCIsZBFfYtt8JrzFCwl+C+wz0hhnpA8CCzJqeiTmleEFdz2i3jtapa9EE
         L2fhOyB4vIj3CAC8YmbQsUvNwPsjDv9mvPjffXHOFlcaBRowboyMcjG2PfT1JIWglBUH
         aWEMWu5IkK/vHJ2VO+loA+2NQBrbvt6q5BmEztS5StTut1G7l7l4Osv3+/5SeEd4Ueb8
         /pxhVKKvn/o4XmluN2Ii16rlCd7rTdcfToOBaTXYsXqFlmMntxbJL/xdCIhKmvzC+YSl
         AB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775162620; x=1775767420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21ClTGnhigH6pmJ1bdxGPTsm+cYy8Gt+rk4//h1qZck=;
        b=B1KY2+dyWGRXgvbi/C5N/a0DKwHyOKHxe7MfDYOvAnMGJmdRqOXJS0p9qVGrRDAsc7
         2KfmNoSmOudTLqvD81CvJZXcoKzlEWN9owKYs+jwlk1Fjt9sWdp2FuB8HkBgJXksG7zo
         BY4VhkQOmxiW2YTZDbym60GaNoIznZ1pD7dmHooyKcqbA659LGaVyzWum+z+U3iL2Jzu
         85MLHAS/LGg1yo7VHUZAyQsYaGRpfCMdnMgb1+CeRjV2+6V6r4LbjDR2bmMK/gxFBwJN
         xXywOi5PwAnjKmvpA9w0mxAjpfwYZtY0bA/SrkEwekhr5imtweYFh44D6ccX7Komv2Yi
         0umw==
X-Forwarded-Encrypted: i=1; AJvYcCXCM34ftFDZDprvfu+bHnKzEdkq7Gjf2lmItdDcc1T6AM4vJ8Y9w1fjDo25sp3ITKM0MUXkwHYO1DuZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzoPEqRb2mJmD9w9Gc4MWdj4BPpexRG24ajn/e2U0zlr82u/Row
	9tfShDnumaqsv3sFX0pBl3PX7oZ8Vj0RFYYTx9cQGZ0+Sn96L0Y8sbcz
X-Gm-Gg: AeBDieuuPyUkLVj6oEM2GPasNwPFyzsBxoN3tQiclRvrwHQXl72CjoQ86kiQOV6hUsN
	8quSgqjgA4GnF9hME/99QSLxLsuCLhSKOUCMNNNfqSsJEcgAFlD2O4j0PiYnrUKjh8N9GXP+OTL
	hReXfi5b4cM5Sk17VhRRvD8uj1OKOAfVTKmCunqszrjoRoBlSOYNdYDTb61gBZvrGUrKtIqrl0U
	4wRZ9QRI1reO+0l7HtlZKSkV4IYzi2ppjDHOf/SwgNWtxrM/eBefbRekOq2Je/+1IlLNoz6bLv+
	sCs4c7LNNZRdJthhnjO0ycvldOoN/Fto1S6XG9hRqZwLUgvzwqme4wcLgMMYWNN/BTMjsjwr2pV
	8TyWRAnZF2tWN1x3am5j6oKrUupLDUcbMRmkdarA607/N19U0/SN3NWnzWKDzwsEBXJVPQHZ75v
	ZRUbF1DwNoCwhksyIUt8c4YKhaOySm30pJx21MgzRFhVbIV5+RcvIzMm+Vi08I47QZ
X-Received: by 2002:a05:7301:1e87:b0:2c6:cdb3:bd8d with SMTP id 5a478bee46e88-2cbf9afd61emr347222eec.7.1775162619471;
        Thu, 02 Apr 2026 13:43:39 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:902a:cd8d:1c0d:8926])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20b195sm3280897eec.16.2026.04.02.13.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 13:43:38 -0700 (PDT)
Date: Thu, 2 Apr 2026 13:43:35 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, brgl@kernel.org
Subject: Re: [PATCH v2 1/4] software node: return -ENXIO when referenced
 swnode is not registered yet
Message-ID: <ac7UqTsPC8yUooAR@google.com>
References: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
 <20260402-baytrail-real-swnode-v2-1-6f5054a4cc07@oss.qualcomm.com>
 <ac5wprh9vfTU5pGa@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac5wprh9vfTU5pGa@ashevche-desk.local>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,gmail.com,linux.intel.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-34617-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0C3AE38E1C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 04:35:34PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 02, 2026 at 02:54:26PM +0200, Bartosz Golaszewski wrote:
> > It's possible that at the time of resolving a reference to a remote
> > software node, the node we know exists is not yet registered as a full
> > firmware node. We currently return -ENOENT in this case but the same
> > error code is also returned in some other cases, like the reference
> > property with given name not existing in the property list of the local
> > software node.
> > 
> > It makes sense to let users know that we're dealing with an unregistered
> > software node so that they can defer probe - the situation is somewhat
> > similar to there existing a firmware node to which no device is bound
> > yet - which is valid grounds for probe deferral. To that end: use -ENXIO
> > which stands for "No such device or address".
> 
> This error code is also too generic to my taste. What about alternative(s)?
> EADDRNOTAVAIL
> ENOTCONN
> 
> (The brief grep shows that the second one might suit slightly better than the
>  first one by existing use cases.)

We are in the core of the driver core. Why not simply use -EPROBE_DEFER
to which all users will resolve this error to and call it a day?

Thanks.

-- 
Dmitry

