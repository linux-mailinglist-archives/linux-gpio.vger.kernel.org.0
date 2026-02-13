Return-Path: <linux-gpio+bounces-31654-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMQHHBnhjmluFgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31654-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 09:30:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FDE1340DC
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 09:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3F7730C4505
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Feb 2026 08:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15D4932BF47;
	Fri, 13 Feb 2026 08:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kX2tOZB6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6BC32B99D
	for <linux-gpio@vger.kernel.org>; Fri, 13 Feb 2026 08:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770971364; cv=none; b=n2RJ6se7x14pahoFXHDn9vnmGcLgiZG82/Z7qMy/o6rZFcrZYmKqcC3oOgBFz2rirvHX0DnkAf4ncaf1uDCGe62i7cI1eC2vhwxZW3ImakfVgKCFOrlcWJ3EAap1HGhf+e9yiYCsA8iUavIOpPlfepJj/Fm4kg9nrHLwvu8KquQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770971364; c=relaxed/simple;
	bh=RTo8u2Sedn1CnU8sFrvE0WSM41I0dJtuSDAEhq8+kRw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bTdqa81DCqSk3eLMRmE3OWfLmdwX0RzkwUMU8tQuYVxBVftSxjbLip6/i3DTH/PE9nNXopuFelPI4ZwWbCDNus/CYr74mZDCGEyNHCx4M82gp1HG/FftG3bZ77CL3Ns2GOUssSkUWMIc9QBPqWo0kjZ93uGm4V9r5cl+OEwav18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kX2tOZB6; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E6B204E40C76;
	Fri, 13 Feb 2026 08:29:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B953F606CC;
	Fri, 13 Feb 2026 08:29:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 815FD10368E05;
	Fri, 13 Feb 2026 09:29:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770971360; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HTw/HXY0Gs/LRcdanaDRSbVGf28t6RLADO9IJc09aSQ=;
	b=kX2tOZB6aHe0Ba7nQ8QVjJLwvpMCkA1F71AAYE8sXzdBhBSC85zwePyXhYgkNVEqqyRDdw
	SGZgiCCGPDKvyNZxe8JZJd8d6YaWF5PpGcmmvM2PJfBG1pbl+0ztWbTJRD47amwkkwx2du
	sXwkDfsNMciFmP0SiewlO5qNEg5B2Qul6bRCVzJNYFzg4UWXdseoWscyV7YCHFqOq4J1mm
	BxJaHzr9H6aC5T7pGfXP/fOJDvfmpG6N3VJmP7BNkz2lhRqKpize45wGqZPguFyMa2W+z7
	wobewpFhqkLTrNMfN2122VT/VECv6KfG3447Ve4ecdzzo/0s4jOaFQE/wb10PA==
Date: Fri, 13 Feb 2026 09:29:14 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Bartosz Golaszewski <brgl@kernel.org>, Rob
 Herring <robh@kernel.org>, linux-gpio@vger.kernel.org, Linus Walleij
 <linusw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexander Stein <linux@ew.tq-group.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] gpio: aggregator: add gpio-aggregator DT
 compatible
Message-ID: <20260213092914.79790cb9@bootlin.com>
In-Reply-To: <89c0dd51-fdd5-4368-b5f5-615143ffd166@kernel.org>
References: <20260211081355.3028947-1-james.hilliard1@gmail.com>
	<20260211081355.3028947-2-james.hilliard1@gmail.com>
	<CAMRc=MfgoKmsNAmn3rO2jDL-ZArMX2Jh-n4SnV6rpzRY3KSwuA@mail.gmail.com>
	<34a9b531-4f53-47ee-861e-1b18ff1a5752@kernel.org>
	<CAMRc=MfwQ8J7eT_geEf7Kj230SOvmO-LDHz9a_YgfRY-QB5V8w@mail.gmail.com>
	<20260211214708.GA3947691-robh@kernel.org>
	<CADvTj4p-zHMrXW+GJstB2sKS-7Wij98JNJGoiPiYmaP5RHhNQg@mail.gmail.com>
	<9afa52c1-b7de-4ccb-9114-a142567d21af@kernel.org>
	<CADvTj4pmAXo+KUMyB0=+x3HRdUdUq=baj_pnoa44oxnugZuTOg@mail.gmail.com>
	<89c0dd51-fdd5-4368-b5f5-615143ffd166@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,glider.be,kernel.org,vger.kernel.org,ew.tq-group.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-31654-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 15FDE1340DC
X-Rspamd-Action: no action

Hi all,

On Fri, 13 Feb 2026 08:31:21 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> > 
> > Or is the issue just with the name of the compatible I used being
> > called "gpio-aggregator"?  
> 
> No, the issue is that there is no hardware you are trying represent in DTS.

Except if you have a piece of hardware that invert the gpio line.

In that case you need to set GPIO_ACTIVE_LOW somewhere.

The aggregator allows to describe this line inverter.

Of course, if the gpio is connected to a hardware component handled by the
kernel, the DT node describing this hardware can set the flag.

The issue is for GPIOs that are just GPIOs and should by a user-space
application as GPIOs.

Some bindings exist for GPIO and do not describe the hardware but the
feature. For instance:
https://elixir.bootlin.com/linux/v6.18/source/Documentation/devicetree/bindings/trigger-source/gpio-trigger.yaml
https://elixir.bootlin.com/linux/v6.18/source/Documentation/devicetree/bindings/power/reset/gpio-poweroff.yaml
https://elixir.bootlin.com/linux/v6.18/source/Documentation/devicetree/bindings/power/reset/gpio-restart.yaml

Can we consider the gpio-aggregator describing the wires that should be
grouped together.

Industrial board can have some GPIOs grouped together and used as inputs or
ouputs of this industrial board.

As output they command an external system. As input, they get feedback from
this system.

gpio-aggregator describes those lines.

In that sense, it describes hardware.
Maybe the "gpio-aggregator" name doesn't reflect that and a compatible such as
"gpio-equipment" could make sense.


Best regards,
Hervé

