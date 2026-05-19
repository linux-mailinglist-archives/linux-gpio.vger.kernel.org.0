Return-Path: <linux-gpio+bounces-37109-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNyfHaHaC2rRPQUAu9opvQ
	(envelope-from <linux-gpio+bounces-37109-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 05:36:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA78576DA5
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 05:36:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DAF7306B345
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 03:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 475B62C15A5;
	Tue, 19 May 2026 03:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dZXeng8L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063162C21C5;
	Tue, 19 May 2026 03:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779161596; cv=none; b=bErIy5IebC7cxd6XbXVjcloVxQoY53PII44YFyTGLGP1FS6kmKXjB7HhnyHG4gA/Rm5+e76lUMvBQnHcWD1XIuU4BX02VFVQzjHDtTik2Jw0PNaizvZUamkzCF2Au9zeka306RALVZ7dHdCWNJcyq047bdAg0XbvVwE2HcIkHVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779161596; c=relaxed/simple;
	bh=nNGLrblv0/b7AOEWkQKCScnySMIYkQZmQcO2r2Am1pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y5iaX08hHW2wjazmCjUJrl79iIBZJv3CRM9qbo6F0oldjk29XsYFoY25WbR3iG7DA+/QcVT2P0wTxnVYhvIaBvz+/ZAJjVcTa+7evmefm6zVUdM5AbvKNnAxj0vKEeYcq1qNvzo7rht+AeRqIi8kK0ybvQr7bbKbuCrXAonJ/AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dZXeng8L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C84DC2BCC7;
	Tue, 19 May 2026 03:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779161593;
	bh=nNGLrblv0/b7AOEWkQKCScnySMIYkQZmQcO2r2Am1pg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dZXeng8LpbnwJ5sUDiKNrFv7Xpl0bw0de59RFGpioSQPwCtHhvAmKzhLoC9592tj6
	 aGGHVfqzt2QMSkyl95bVvn43y4NnUFaQarKl9B4PxCooh4YWuX3+iWbxzRErfIsdGs
	 nAc+oEF9L13q8IGWN4Yn3mikxp6zkgj2QLvieUKCEb+zopUlOaltsnMn8hAIncd18s
	 qmecxdqko9sY/D6cMh9Jb+Fl2SoJm3cMAtv76mBrU+jwvhVdzIx3oCFbAVGOm6uiOT
	 +WRw9TeSZcASoQV95tqFz6aVpJjL/fdAVrwNixuAiMJAgz483BbqOXO1N282+E1ng1
	 ZuLdOxzdq0pjw==
Date: Mon, 18 May 2026 22:33:10 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: Replace open coded eoi call with
 irq_chip_eoi_parent()
Message-ID: <agvXluPCLIQlq267@baldur>
References: <20260514-pinctrl_msm_irq_eoi-v1-1-2d152f8695f8@oss.qualcomm.com>
 <agvW8hetKSsPAXgv@baldur>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agvW8hetKSsPAXgv@baldur>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37109-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 0CA78576DA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 10:20:55PM -0500, Bjorn Andersson wrote:
> On Thu, May 14, 2026 at 02:08:25PM +0530, Maulik Shah wrote:
> > Replace open coded eoi call to parent irqchip with irq_chip_eoi_parent().
> > 
> > No functional impact.
> > 
> 
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> 

On second though, I'm not sure I want to r-b this patch.

The commit message explains the action of the patch, not the reasons for
the patch. From the description I inferred that irq_chip_eoi_parent()
does implement what is open coded here, and a quick glance confirms
that.

I'm guessing that irq_chip_eoi_parent() didn't exist when
msm_gpio_irq_eoi() was written? Or was it not used for some reason?

> Regards,
> Bjorn
> 
> > Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> > ---
> >  drivers/pinctrl/qcom/pinctrl-msm.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> > index 45b3a2763eb8..6771f5eb29e4 100644
> > --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> > +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> > @@ -1012,10 +1012,8 @@ static void msm_gpio_irq_ack(struct irq_data *d)
> >  
> >  static void msm_gpio_irq_eoi(struct irq_data *d)
> >  {
> > -	d = d->parent_data;
> > -
> > -	if (d)
> > -		d->chip->irq_eoi(d);
> > +	if (d->parent_data)

"I know that irq_chip_eoi_parent() will peak into d->parent_data, so
let's peek into the object first to avoid it dereferencing a NULL
pointer".

I see one other caller to irq_chip_eoi_parent() doing this, most
everyone else just register irq_chip_eoi_parent directly in the ops
struct.

Are we doing it right?

Regards,
Bjorn

> > +		irq_chip_eoi_parent(d);
> >  }
> >  
> >  static bool msm_gpio_needs_dual_edge_parent_workaround(struct irq_data *d,
> > 
> > ---
> > base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> > change-id: 20260514-pinctrl_msm_irq_eoi-ab736e16d411
> > 
> > Best regards,
> > --  
> > Maulik Shah <maulik.shah@oss.qualcomm.com>
> > 
> 

