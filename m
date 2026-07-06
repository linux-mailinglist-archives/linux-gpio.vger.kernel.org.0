Return-Path: <linux-gpio+bounces-39530-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qqWyOWHSS2qbawEAu9opvQ
	(envelope-from <linux-gpio+bounces-39530-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 18:05:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8277D713011
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Jul 2026 18:05:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=MqT1GJ1b;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39530-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39530-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D8578300100F
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 15:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC53F422558;
	Mon,  6 Jul 2026 15:56:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719A13B71D9;
	Mon,  6 Jul 2026 15:56:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353418; cv=none; b=GXlJ2qSINgAZpGMjrlnaGVG2RsKnwrC66Kl6oltefyqy4j0wnh79w9Yhc9wLWoAnnHBFnD9lBBev6nddkeXmIeTSvyDyXyUXYV6ApLX+WJ9MKQhJLVnbDfYQKmQHpE6SGvtRDT2kGrvAtzGX3f9XvYJ7f+AQXd7tx3ThVzzsrBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353418; c=relaxed/simple;
	bh=2kFLrfr2SmRE0cZj3dKv067Bp9MA9JMZgbktTc+AwTI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=edDbP43ipe/+ida80wutd1SVO7H1f3DObdy5IW3GZo72I9u7G1Ue+WAiKYHITtpo+dSI76AJn5MGbuy1Ah74MjffN1yZ+DYhkoeOOO12wCkpRoyQj8SJJ4VUzGyJnbfsuS4G9B0iRE9FbUKnGPvGHwsQMea7UhB5o8mOFT2pYkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MqT1GJ1b; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2D5A1F000E9;
	Mon,  6 Jul 2026 15:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783353416;
	bh=nzzdP7uvLDDy9UL4t9qBVucGAuCunMPD4JQqpl+vDcM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=MqT1GJ1bJRdM9xmfUyrkptepYB8rQuP58TiM3OO3GSgwI0hO57MQJRVIh/NqXA5vq
	 IJfhTHqLw0HdmpR1kRDKlTWFING2AWZd7K26eRvJ2lpENh+rL9adpv9IDSluwTowmM
	 E6nQsSQq3KqCWB4o6UEtBkp6gPxIQvI4NHfRbWgj0UIctg4Zy8T3U6OOBrgp9j5WYC
	 GA6ChGEn7i9OnVvagil2o/rXxBbv8WLdewrAXRKnj2veT5/lYJMmNC4B+W3T3FtvvN
	 hFhsEkzzz/RRtca2rnmoWn9TGOqNmxmntnszm3uIXoS1KWFTqxWHVEoWCB4HznaYCl
	 5koCKuiYNrGGQ==
Date: Mon, 06 Jul 2026 10:56:56 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: me@brighamcampbell.com, skhan@linuxfoundation.org, linusw@kernel.org, 
 linux-kernel@vger.kernel.org, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, krzk+dt@kernel.org, linux-gpio@vger.kernel.org
To: Udaya Kiran Challa <challauday369@gmail.com>
In-Reply-To: <20260705132521.159522-1-challauday369@gmail.com>
References: <20260705132521.159522-1-challauday369@gmail.com>
Message-Id: <178335341606.6594.1044367992969150438.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: microchip,pic32mzda-pinctrl:
 Convert to DT schema
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39530-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:me@brighamcampbell.com,m:skhan@linuxfoundation.org,m:linusw@kernel.org,m:linux-kernel@vger.kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:krzk+dt@kernel.org,m:linux-gpio@vger.kernel.org,m:challauday369@gmail.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8277D713011


On Sun, 05 Jul 2026 18:55:21 +0530, Udaya Kiran Challa wrote:
> Convert Microchip PIC32 Pin Controller devicetree binding
> from legacy text format to DT schema.
> 
> Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> ---
>  .../pinctrl/microchip,pic32-pinctrl.txt       |  60 --------
>  .../pinctrl/microchip,pic32mzda-pinctrl.yaml  | 141 ++++++++++++++++++
>  2 files changed, 141 insertions(+), 60 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,pic32-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.example.dtb: serial@1f822200 (microchip,pic32mzda-uart): 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	from schema $id: http://devicetree.org/schemas/serial/microchip,pic32mzda-uart.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.example.dtb: serial@1f822200 (microchip,pic32mzda-uart): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/serial/microchip,pic32mzda-uart.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260705132521.159522-1-challauday369@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


