Return-Path: <linux-gpio+bounces-31683-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LD+I187kGnUXgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31683-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 10:07:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2CF13B882
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 10:07:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C2E143011C5D
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Feb 2026 09:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7AC30DEA5;
	Sat, 14 Feb 2026 09:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YJKqHOqB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E338427A907;
	Sat, 14 Feb 2026 09:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771060058; cv=none; b=OE+1G2xQOT5/LDi0Rd+m1qGQt3oXxuMzW4DCqWLWVTOMT2/zD7kJIW7RWNXlzei2/Wvhq2QI0rHKMg0q3MGW0d39lhy+k1bmn50qkgTn+br8oKEkKqQEokpDrmrHMoyyRINUT5QCB5c4jxEsOR8TGTqlwfRj1N7jRQYPwd/cfos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771060058; c=relaxed/simple;
	bh=QnoTxaKyeU8gC/a5USfVyuYI9bzRVBDGxlvhi+VrFcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c5aXytE3ZxbpYFYIrRLPrnJdxHKRqJPSZTd4TwpgB41INYusUJN+5NkSI5j/o43AQSvLd4bZoLS85IFknl6Ptmf53Sppv8/DsTimDAbh0Aqw/EgnR6ITtm5F+kWrz2g9+jN7CG0ZMqQ8osPb9DAdnzR/yEfH0n/nO+FZLqifl9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YJKqHOqB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3949AC16AAE;
	Sat, 14 Feb 2026 09:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771060057;
	bh=QnoTxaKyeU8gC/a5USfVyuYI9bzRVBDGxlvhi+VrFcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YJKqHOqB9uuYyNqfMQ27i8uBg/K6aqjEk2w8lZcPwSXbTIjXyTfKNQV96Rov7bTZE
	 zcFwHhO7lFvymtsi70KJR+CNMEE5O1+SkcZSZcyMJ05UYcQeUbbXoioWRjAMDioIsp
	 dzVs3PqaiWhMrPFqxCQIjsluF5x0Q83Tfr+E5DUUQIDr4e81uHWjBIp1R2lQxzw76f
	 S1550ve38bCjpfnJ7a4gn3+KCfPPAhZsymaOmUAbAxvC02c0QUzMSfdVRJYoasX4aL
	 wFQhsVlxoXiytaUQz25XMWIxu04ounOybu/MwcopeqTLkl3GTZzBmKahWWgT7mYiCw
	 ZDhYsFVdJj1OQ==
Date: Sat, 14 Feb 2026 10:07:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: gpio: document gpio-line usage
Message-ID: <20260214-loose-slug-of-courtesy-bd846f@quoll>
References: <20260213223204.2415507-1-james.hilliard1@gmail.com>
 <20260213223204.2415507-2-james.hilliard1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260213223204.2415507-2-james.hilliard1@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-31683-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2B2CF13B882
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 03:32:02PM -0700, James Hilliard wrote:
> Document gpio-line child nodes for GPIO controller initialization
> without line hogging.
> 
> Describe gpio-line-name semantics for both gpio-line nodes and gpio-hog
> nodes, and update examples accordingly.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  .../devicetree/bindings/gpio/gpio.txt         | 47 ++++++++++++++-----
>  1 file changed, 34 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
> index b37dbb1edc62..cf591954eafd 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio.txt
> @@ -199,28 +199,41 @@ gpio-controller@00000000 {
>  		"poweroff", "reset";
>  }
>  
> -The GPIO chip may contain GPIO hog definitions. GPIO hogging is a mechanism
> -providing automatic GPIO request and configuration as part of the
> -gpio-controller's driver probe function.
> +The GPIO chip may contain child nodes used for line setup at probe time:
> +- gpio-hog: reserves the GPIO line as a hog and configures it.
> +- gpio-line: configures the GPIO line without reserving it as a hog.

New properties do not go to TXT bindings, so if you want to introduce
gpio-line, you need to send a patch or pull request to dtschema.

Otherwise how do you validate your DTS? How does it pass validation?

Please don't send a code which fails - either on upstream or downstream
DTS.

Best regards,
Krzysztof


