Return-Path: <linux-gpio+bounces-33263-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFGBJSbdsmmtQQAAu9opvQ
	(envelope-from <linux-gpio+bounces-33263-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 16:35:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BF9274952
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 16:35:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 343D430219B0
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 15:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA1D3C9EC4;
	Thu, 12 Mar 2026 15:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CwgXGj8y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187863C943B;
	Thu, 12 Mar 2026 15:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773329492; cv=none; b=jjx+lImzs0/myf1HCiSJmoBg9PM/GPOhb6BxlCcPcMol+5k+SQNMUct0BF6TJy0oXrYoF28DpTk2l9PpsyINnwT/i7oi/0kWuB45krGlxgXuYzkm1VDy0ieO6FTXtnvW3NkjIenUsZLJMs6A0op7K2P0NZ5srgaB2iO6DF55Xho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773329492; c=relaxed/simple;
	bh=nM7mxcedWBXClU4VvgLd8VHnKMBqGYEjylyr8nYUbzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qiyfRyyOqfPgUtsQkGpqGTe/0ZR6veJeIpcF//cWh04KAxFgsecvhoZYw/k0XK+CRCNSlVzVdu+Ycui3teuU8/rBo1//buSzF3udQpmKMDcOEyVXOw0POFp+ESm+7eWDp8LbJBbJZlnt4jwwahgwWCCQ9VgzBx61zXCEj16zxQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CwgXGj8y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 854A3C4CEF7;
	Thu, 12 Mar 2026 15:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773329491;
	bh=nM7mxcedWBXClU4VvgLd8VHnKMBqGYEjylyr8nYUbzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CwgXGj8y0+ZGnWJ38GM07ZNAKNcH1E+6Oem2eE/mtbsTl3xxIN76fqa8ewR6somKy
	 C9msQXXW/aFE2Hvp51SOOug9ZOOZ1ZcT3iBLjh7OzBM1M/C0yu5mVgfKpoDIETn7QW
	 Mw0YfB+pYyvxGOKI6rTSD5cXbP259qZ8JIbWFc4QlTcA428eziLygBI123tb7MuXBj
	 ipk4OAohSLhuu11DO8rcp8ivodae5bzQPlfNNmx+TaW7taXVn87ENW8WnSFUhd3G6E
	 jSI+aEcnzVjhf865PS/I3GnPgT+/mq3hphTXB+MarvCw/OfFTbm7DPTWLU1bNUSeQg
	 OKZD+1VJzIJcA==
Date: Thu, 12 Mar 2026 10:31:30 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>, linux-pm@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v4 4/5] dt-bindings: mfd: max77620: document optional RTC
 address for MAX77663
Message-ID: <177332949012.3263886.11722832171482472961.robh@kernel.org>
References: <20260312085258.11431-1-clamor95@gmail.com>
 <20260312085258.11431-5-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312085258.11431-5-clamor95@gmail.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33263-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,intel.com,arm.com,bootlin.com,samsung.com,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 21BF9274952
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Thu, 12 Mar 2026 10:52:57 +0200, Svyatoslav Ryhel wrote:
> Document an optional second I2C address for the MAX77663 PMIC's RTC
> device, to be used if the MAX77663 RTC is located at a non-default I2C
> address.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../bindings/mfd/maxim,max77620.yaml          | 22 ++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


