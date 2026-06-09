Return-Path: <linux-gpio+bounces-38192-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L80xGBE1KGqkAAMAu9opvQ
	(envelope-from <linux-gpio+bounces-38192-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 17:45:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFD5661EEE
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 17:45:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=YmeBzIEm;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38192-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38192-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 169F8323E120
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 15:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96DDE48A2C6;
	Tue,  9 Jun 2026 15:29:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DA1481A8D
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 15:29:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781018978; cv=none; b=i7vL1BeUxvOfHj0j9PdHfB/2JdUr9GToH6kBL9DFzejX5bhgdZjTpUH/jsUED6tjdDwCEphO0pmyyEHNPFKAVCMUJ/9RRvg34jgeFor2ut3Iquax43/FRlG8BskiukFrkrFI2ujkMDjzt43Vl8HXzsjulp+Qj0LTjJhgRfTGOC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781018978; c=relaxed/simple;
	bh=oBMTASf5/yZwoC+w3jFNarp/B0A2dybfqyHkkOvqM8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rnFze/IXtmx3/ekiyEcXk2r0Qa+GCYE55TlO5JWpBMlbhu01YuG5iqF9/4MJNdgCeUYegxXxQ0+d4YVaQ+VRJR+9NFzRB65xwUml4hW5K01DhSI8RtRIv9jzusDkdKbKqmwwHePAnE4Q1p9DfUdCjoTDgA3aabwb3TgerfSmi98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YmeBzIEm; arc=none smtp.client-ip=209.85.210.181
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8422a92b6d6so3019547b3a.1
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 08:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781018977; x=1781623777; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KqNUdlMGs9SJSOAMJ3lmDavV/mMqU3C6oJBVPqeQ0EI=;
        b=YmeBzIEmqoQDEW6G9Nh6k5kFysNDjseU6avBkwrDBJYuuBNz1zC4Ect25XU7rM30FO
         cJquyzccYYLoLs8ipzxZj+2O9YnVy//fCjtLIpGgAEyvnk+wzcuBP0MT1e9rHZm48zOp
         j9orlUulCCsfqBGabTATEBQsHEXJf5qpmkIHaUxueI+4cXT1U1DCXUAgMUX8CUgoiBl/
         a/jvAGmJ+VpJfREee7cR24iyprwoBKKYH+PgEK19f0QRGkAMaKNkdhSBPtn/zSdaoJdg
         LvduC62uXJHYaf3+U+ncraiEeeVwetcZ941n9mPl86Dm53MvATCKHtBgn04JmVXEz5z/
         yQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781018977; x=1781623777;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KqNUdlMGs9SJSOAMJ3lmDavV/mMqU3C6oJBVPqeQ0EI=;
        b=YHgR1Gu9yxHBfXpIDhbvv/sX6OGp8l+NJpP2Q+RbNimNoj4Dl0f71KZMnzVWws5sPh
         YD17boOuCvYNy3Z4ESHjZAmx+iaIa4OpJgJF1ME3DKqYBucAbtVpjBsNv0vTcwefgceJ
         mfVm5NGdVtebh1lPwz6eF7ubYENjTbkRu+LHjrTCPevVCnYSatkiNAfge13in5kDm+vk
         cvhXD1ln5mRLcwrIbRAzlQ0gvhAVh/WQ2gGwGl7a3/yK7LIzOa0gruyP1n/eQ9Vwi8ZL
         Z5PhQ/RyS6qegtzor2G5/T8CQt49q+ZyjyHJEVqq3w1W4PdszcP3NNHeZ/SX38ED0g7e
         ybww==
X-Gm-Message-State: AOJu0Yz9JcxAcoifkH8csnUTmQ9BjAT8uDTxwRoyYpozmDYQzxMDL+RO
	N5Q9/ut3UmyIHlj8hrotdZpFKnhrjN8wEQW5zbFXCpDYokoqSW+k8eWq
X-Gm-Gg: Acq92OGwCd9JAL5wHk7LQ4qQzUxmLp64U/yD5QC3JW4bc9g0N9aOw4i42QfGwYJKdZB
	oFwfwlqFwm3+3m18TY8FK/B5aIR4qc54H5YgAm3EWONvaP03Ez9/EUYHXDP7KADc+dBdcVLHVS9
	C8Nie1tcSA+WfBTQxTfcohCFVIHIQJZu5qG/WxqiXLQLRKAYNu8ntUPt/T0jdHk2wnXACheaM51
	u4dpGc+DUZ8/Ep+cvahZKzltcsgEjYtBZAlOOKN4VQKRLUjrZGIU9bLW+jcTTNdxssdueMuGA9y
	uPPQ4o4rVIE7bV6vntzblzGCVyQKp9Pt39PNh/dSCBnYN6DYaM8c9b+1fRAkuZkSPwAnifsnsJo
	aba82lgS+1NZm+hGsJCw4Pe4tecJEP/PEGBCpVqZZx+I8TIcK7ZakKjkDrKTZ0ia77XiE1cgMKt
	1f7PHoWG4xwXQ2tU3sAq8SvZBMBssEU5+jbqLAqhvrItJztOr23XjUVmpHiw==
X-Received: by 2002:a05:6a00:1405:b0:842:3841:fdb9 with SMTP id d2e1a72fcca58-842b6823968mr15870182b3a.31.1781018976770;
        Tue, 09 Jun 2026 08:29:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428288002asm21603784b3a.31.2026.06.09.08.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:29:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Jun 2026 08:29:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v13 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
Message-ID: <7f1a04fc-587a-4a5b-9c5d-8f73ea5b2114@roeck-us.net>
References: <20260502-ltc4283-support-v13-0-1c206542e652@analog.com>
 <20260502-ltc4283-support-v13-2-1c206542e652@analog.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260502-ltc4283-support-v13-2-1c206542e652@analog.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38192-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nuno.sa@analog.com,m:linux-gpio@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-doc@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:linusw@kernel.org,m:brgl@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,analog.com:email,roeck-us.net:mid,roeck-us.net:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CCFD5661EEE

On Sat, May 02, 2026 at 10:56:53AM +0100, Nuno Sá wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> Support the LTC4283 Hot Swap Controller. The device features programmable
> current limit with foldback and independently adjustable inrush current to
> optimize the MOSFET safe operating area (SOA). The SOA timer limits MOSFET
> temperature rise for reliable protection against overstresses.
> 
> An I2C interface and onboard ADC allow monitoring of board current,
> voltage, power, energy, and fault status.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter

