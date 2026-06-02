Return-Path: <linux-gpio+bounces-37818-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A5JECZPRHmrMVQAAu9opvQ
	(envelope-from <linux-gpio+bounces-37818-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 14:50:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A35DB62E28F
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 14:50:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BZcnb3Ne;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37818-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37818-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7A38B3049F80
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 12:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E718E3DDDB6;
	Tue,  2 Jun 2026 12:48:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DF62765DF;
	Tue,  2 Jun 2026 12:48:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780404487; cv=none; b=hYkK8nwCQoHh3Nl5OvjL8Q+CXTCMN8e01FWWfS71eRyBXUpIABd4jr4IdJ82VgmOtdwlp6+uzUWxum+GXGyqap/EeMLslDBD/WnjRgGvIzhH9Z0crf4wnueb6Ril3qsv/0yweEsQfFS/xrEuD3tVlipp1sb5cV+NMlGWKguIMgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780404487; c=relaxed/simple;
	bh=hxB82OwR/c2b5AF1j39uyClP13FSUWRKhi3oip7J4bo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kkXP6yucm3B3ruUOY3TSuhOKRYDDx6XI2/HyZXs/696DKGoWTSrhq+8K5NrBD5GZYuclOg0don/AQc36pM6nP+gFVC5rYOY3xIphlNSAZ78HBYM99sS3OIHqQUai3nL1AILZyHipK6rNnO1oDpu684F0PHSFhXMRBeaj6i1PIWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BZcnb3Ne; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7B511F00898;
	Tue,  2 Jun 2026 12:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780404486;
	bh=iCZKbEEGJwyGjbTw3VbjcJ0aH82ATivE84+H+5iwvjg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=BZcnb3Nebu4GuTulLEBMCdckbcc/FKFhUO0BIPGuDrQOmqVvI8dStqzOjSmXLa3iG
	 tx3jsarm7muLQB16y2j3nsqkJZg6Yz4OWd+FkHIEFRQlIS6SIfBqL3ZAYxl9EAtbUt
	 O3W7Eu5jsGe4DnXmxCUmCBnJdd9SlJcp2Ejpa2W+aYFLWpwiWb/UYRO547pWB5gKYQ
	 Z0QIopr89UhlZKfVHYSMT3C7ubCMMrDWH1u0AeDkLlH4tP/izVMZybkt5fBHzvfgXB
	 6+MyaFn3LSS/CHwSGtZ441/6z+tiCUcrQpnhSWcaGO0J2yp+uaZkNmEmIPAnm+2Yjm
	 zNKPlBVpvb49g==
Message-ID: <385c0e3c-f131-4d38-8d82-0e0b4ab8e96a@kernel.org>
Date: Tue, 2 Jun 2026 15:48:01 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] pinctrl: renesas: rzg2l: Add support for RZ/G3S
 I3C
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: geert+renesas@glider.be, linusw@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20260528080439.615958-1-claudiu.beznea@kernel.org>
 <ah7AAgK0plmNfL5C@ninjato>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@kernel.org>
In-Reply-To: <ah7AAgK0plmNfL5C@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37818-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:geert+renesas@glider.be,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:claudiu.beznea@tuxon.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:wsa@sang-engineering.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[claudiu.beznea@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[glider.be,kernel.org,gmail.com,bp.renesas.com,tuxon.dev,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A35DB62E28F


On 6/2/26 14:35, Wolfram Sang wrote:
> 
>> Series adds pinctrl support for the I3C on Renesas RZ/G3S SoC. For a
>> clean I3C support, cleanup patches for the pinctrl driver were also
>> included.
> 
> I am ready to test but this series doesn't apply on neither master nor
> -next of today. Could you kindly push a branch to pull from somewhere?
> That would be great. Thank you!
> 

I pushed it at [1] along with the v2 that I'm preparing for the i3c driver.

Thank you for checking this,
Claudiu

[1] https://github.com/claudiubeznea/linux/commits/next-20260601%2Bi3c-upstream-v2/

