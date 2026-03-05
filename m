Return-Path: <linux-gpio+bounces-32617-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cB54EmEWqmnFKgEAu9opvQ
	(envelope-from <linux-gpio+bounces-32617-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 00:48:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DF42197C8
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Mar 2026 00:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4B263037ED9
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Mar 2026 23:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E43AB369210;
	Thu,  5 Mar 2026 23:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1AFspK8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C803537D2;
	Thu,  5 Mar 2026 23:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772754329; cv=none; b=s6mnFdzDuz47F/yeudxvp1oubXpllZycwaa83q8oghtAkzDjL9/ax9GG+wb921BNYviQLevvcFfVF7gDlgKaslv967D9iLyLprhdKlW80V4A1lmOH5amOJ2EGkPJ+RWtzmYdbO0B7yO8XLE4tr4ZLMF+Rt7spSQ8PGgmZbuiKmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772754329; c=relaxed/simple;
	bh=8Gida/5KmXiIal+WTdJpBd5LsJd7XHfAR3ah2xYSoPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6GaJOuiDlgRJlG9iSBZQxMXI4D9SiTdLukax2kaH6oM920hVIIJs6AYpoQg+Elhe3K7lY161c09MIfnNv7D88hSkMLjlths/6B/79YymqalffwzNRl/iXX7UfXCE4+n8NQUbPVAu9v/gha38rW+G2sVIp4GrS4VYD20GN+sDAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1AFspK8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37BB9C116C6;
	Thu,  5 Mar 2026 23:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772754329;
	bh=8Gida/5KmXiIal+WTdJpBd5LsJd7XHfAR3ah2xYSoPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c1AFspK8dTr4bH79JK6ZjhB39ddUisVOvtv4vT3/0bbOeckpUm3MuP2a9vqWj+JTn
	 opPgn4D1T7ArFlnRURcn1jbh2wKxfgVG6tXjmXG6VzXKBFKSy+PdvxZPmbVUUPW4bt
	 rgAai555+pXL/M0Vtr6/M+zKRAExeeR9aHYGQuAK62P80pQt8d+Y+OTf0Sjihc8cz8
	 kzlAsC922HGr0D20++mNYhfe+JjyjZNWYHEy/CNckMBVchmoXIIPJxMjIjJq0PaD+B
	 8zAH1ayuipAY4dbLut6CruAQ7i5vvgpyaupfyiniNRR1TtNeR5UGVeGBD+3RzjdOT6
	 AdFHWWtpj9sTw==
Date: Thu, 5 Mar 2026 17:45:28 -0600
From: Rob Herring <robh@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: gpio-delay: Use Alexander's email
Message-ID: <20260305234528.GA796613-robh@kernel.org>
References: <20260212110905.52842-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CAMRc=Me14BeYBgy5_bNk+2riQzGhfTu_5nQhU1R8sXMbO5s8TQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Me14BeYBgy5_bNk+2riQzGhfTu_5nQhU1R8sXMbO5s8TQ@mail.gmail.com>
X-Rspamd-Queue-Id: A0DF42197C8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32617-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,devicetree.org:url,qualcomm.com:email]
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 03:10:57AM -0800, Bartosz Golaszewski wrote:
> On Thu, 12 Feb 2026 12:09:06 +0100, Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com> said:
> > Group/anonymous mailboxes are not accepted for bindings maintainers, so
> > switch from such linux @TQ mailbox to Alexander's email.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > ---
> >  Documentation/devicetree/bindings/gpio/gpio-delay.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/gpio/gpio-delay.yaml b/Documentation/devicetree/bindings/gpio/gpio-delay.yaml
> > index 1cebc4058e27..b99ceff6c5f6 100644
> > --- a/Documentation/devicetree/bindings/gpio/gpio-delay.yaml
> > +++ b/Documentation/devicetree/bindings/gpio/gpio-delay.yaml
> > @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  title: GPIO delay controller
> >
> >  maintainers:
> > -  - Alexander Stein <linux@ew.tq-group.com>
> > +  - Alexander Stein <alexander.stein@ew.tq-group.com>
> >
> >  description: |
> >    This binding describes an electrical setup where setting an GPIO output
> > --
> > 2.51.0
> >
> >
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Are you going to pick this up?

Rob

