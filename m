Return-Path: <linux-gpio+bounces-31131-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CATFCxaHeGk/qwEAu9opvQ
	(envelope-from <linux-gpio+bounces-31131-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:36:22 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB5C91D0E
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 10:36:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 169D63068D75
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 09:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0146C2E22B5;
	Tue, 27 Jan 2026 09:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hqg/p5fw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76802E0B5C
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769506377; cv=none; b=tJT1NsrcZfoiZS2B1sB7iYRhxCQaRmhZv/oSaKrdaIDL0nkoE17bLxypIIZXdcKkx7hl//+3RMwZgp6k/ovBv8Doa3L5EfFXDfC8fySzoxsOrFTwxvmbTQ9md9gACrzwSaRbkK2QxSTaojIBXJACjiKVRAI0pfOUHbbyZpXDSrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769506377; c=relaxed/simple;
	bh=nd4756Hy+92ohyhREHEr2ehaES7a+HF9kecPSnYoKRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i6kWIG3Hau8uZvp+yQLqWA5EANVX9Uv6f1EMzawq8jRzbz7Yub7KLzXFFvL5bIHidOqUcqC7uLGF0OMX+dYb+nftt1BR4gXv7kZoFLIEDpihCJ4vO65s3Lh8qmJ4A5hgAM0Nh5k++EeMh/KkX21wXijXGnRhAzhdMCyX8D7Ccts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hqg/p5fw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73E4EC2BCF7
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769506377;
	bh=nd4756Hy+92ohyhREHEr2ehaES7a+HF9kecPSnYoKRI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hqg/p5fwd0Wtm1K4HPBR20a0ZALUIPwJbR+HTRa2SE9d84XqA97XGZ0n5H7mZ/pdY
	 LrjP7i6moJ/1DKMh3Ytl3YLATfXpP09QgOljgvsJQY/IYIEHYWaCJWONYB5b1bsQdM
	 JVDDcg/mmFlM3swvNUuEodb70UKzeHAXzR3f3GWxzLI+QLDjCYFcH0etlakY+OErJj
	 UtNpdTSkGiffuXXOp+rivvZLqk7ewNp1ny7Vd5fcL9tYwhlehqrW4wLewQ5h4JslZ7
	 P2hD4a0YTZxIISfyde3jLLAOXwD7M0PnMd/pnnluIIr1/1vvlxzzehe1wM3o8X4nrE
	 rDvlKs0ndj1Zg==
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6498401cfb4so917698d50.2
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:32:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWnO4S1sP9EMjc13nf3DUrB9Q3/HRd0a9hu64tTasvK1QTGkc4MxEY8GFEj9vwsT0w7u3jG/j+gfwC5@vger.kernel.org
X-Gm-Message-State: AOJu0YxxSjL5fkrwca2Pk1Ni6V/AWCzZLjhShNYF7FmdUfLl3lZZ6aP2
	t/K4A9ta4D6OPFDNFw8QED57A7OtaVQvTyDNWzPtSmLDhA1uQIL1A+h802OLtVsXjx/uMpQZklT
	JDUO9bSGKbu8N7x0D2HB8tcRPENeytr0=
X-Received: by 2002:a05:690c:fd1:b0:794:78ad:470d with SMTP id
 00721157ae682-7947ab40c1fmr16169877b3.27.1769506376440; Tue, 27 Jan 2026
 01:32:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115114021.111324-1-robert.marko@sartura.hr> <20260115114021.111324-7-robert.marko@sartura.hr>
In-Reply-To: <20260115114021.111324-7-robert.marko@sartura.hr>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:32:45 +0100
X-Gmail-Original-Message-ID: <CAD++jLn3pP4cdB3h5KN04Pn_v+XuvK6ROuxpNfJVhSRJpo2FUQ@mail.gmail.com>
X-Gm-Features: AZwV_QjPaAf4YpNWpzKIxLTu_1dAPvSU-dSWNUWnEkSR0mawzeMGDcKYjAjufcE
Message-ID: <CAD++jLn3pP4cdB3h5KN04Pn_v+XuvK6ROuxpNfJVhSRJpo2FUQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/11] dt-bindings: pinctrl: pinctrl-microchip-sgpio:
 add LAN969x
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, herbert@gondor.apana.org.au, davem@davemloft.net, 
	lee@kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, Steen.Hegelund@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, olivia@selenic.com, richard.genoud@bootlin.com, 
	radu_nicolae.pirea@upb.ro, gregkh@linuxfoundation.org, 
	richardcochran@gmail.com, horatiu.vultur@microchip.com, 
	Ryan.Wanner@microchip.com, tudor.ambarus@linaro.org, 
	kavyasree.kotagiri@microchip.com, lars.povlsen@microchip.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-serial@vger.kernel.org, luka.perkov@sartura.hr, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31131-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,microchip.com,bootlin.com,tuxon.dev,gondor.apana.org.au,davemloft.net,lunn.ch,google.com,redhat.com,selenic.com,upb.ro,linuxfoundation.org,gmail.com,linaro.org,vger.kernel.org,lists.infradead.org,sartura.hr];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt,netdev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tuxon.dev:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: BEB5C91D0E
X-Rspamd-Action: no action

On Thu, Jan 15, 2026 at 12:41=E2=80=AFPM Robert Marko <robert.marko@sartura=
.hr> wrote:

> Document LAN969x compatibles for SGPIO.
>
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

This patch 6/11 applied to the pinctrl tree!

Yours,
Linus Walleij

