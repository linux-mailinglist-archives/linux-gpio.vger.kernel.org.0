Return-Path: <linux-gpio+bounces-37563-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJeGGaewFmokogcAu9opvQ
	(envelope-from <linux-gpio+bounces-37563-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 10:51:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 002135E157D
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 10:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4C74304DEAF
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 08:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1A33E315C;
	Wed, 27 May 2026 08:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l27fnzla"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDEE3E314C
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 08:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779871875; cv=none; b=o0NE2mrHOvEnkONeimeDkmtY24lccD2pDPQQHG3gjBUN/8o6qTi2eenAeJbSeVG7q8x6JRdFHBEL++YOTe7johnAIh2qOF2izHZmzkZL8/+laWTehyXgn6YChOljixJDqEERfRqcIuVizOzBJZkmTAXEZxuXYEarUzBlwEQmBeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779871875; c=relaxed/simple;
	bh=8RDWauARouTeuWItiHH63krrhuIeCVg6xgUplztW2DA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZR0TrAsydV1SsC6d6IXxEsObv8gZLGZWLX1NpJY0MZSSyfZ0m10KL8bQ0zEZlMVeGKJc06OzBMdo5yl1w1sLvABz/En/m3bvEf5YQSrYtw4J8XH13Hy8g/ZWO1u3tFtYA1CDEspzKlDOAlBzKqyBEfUtGwmJNBZ1uggbji/cP9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l27fnzla; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2091F00ADB
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 08:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779871874;
	bh=shyNmS0wjwDnw1+R8QdLkwtiexSQXIOg00oT8h6CiLw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=l27fnzla+Ei3cZ2ayC1xetXsehBIqjcU/ZP7YGYXYE0qmDWtL6MLdWIsp3xemq9Vj
	 yMKaM+hYr9jXX71S+JvrNONsqYo8SjTKHLxFmMjKlk8imzMXo9ldKJSvsw3QmF22/B
	 D2C5oqjHjE2YMmi1WCZBlykahq6k9JmkpvqGg5SvUvj6KoxW9lHIjD1Sl4S60d4ABU
	 qyEEF7UJa3VfdNq9Ys34dYjjkjt20HotTEx2C0B6t2Qe19jqgNYgVpKzM1KSVSdmGE
	 8n5vZdFlEfTJx7l+d+XoHlFcrdkl0bpMbXaFp0ocfPiV1uDIfhh4OMWv3QKrGKqn3A
	 4NBwg9DLNV1zw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a8cb92f26aso12384340e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 01:51:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ98hHzC6rJ9uO7XWm98+g48fxAv05/IgTZS6pWv0VeqUYEvIQjS1bGTU82hRpOTp90sks8xnlNKACKb@vger.kernel.org
X-Gm-Message-State: AOJu0YwjmPIvtbF3qfJqYYqkSHiYDUkv1kTVskgjyoszmnLktHIEnrJ9
	SsvVac61obwYOWgLzKvMa28gz1MPlM+FUOVK3snhqiCqvzBtKvQpgf/5IxlERxiX7mYD9+79lc+
	bi/7HXzZnMDh890INqVnoxnbZSNy/5iCxl1Sw9SdF9Q==
X-Received: by 2002:a05:6512:3ba9:b0:5a4:56:aa88 with SMTP id
 2adb3069b0e04-5aa323c4598mr6986239e87.27.1779871872797; Wed, 27 May 2026
 01:51:12 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 04:51:10 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 04:51:10 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260526131243.2160348-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526131243.2160348-1-sergio.paracuellos@gmail.com>
Date: Wed, 27 May 2026 04:51:10 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mc5bj05ThOMy7eguS9+tPHkevWc3ArYzcQqvB6SrXpO4w@mail.gmail.com>
X-Gm-Features: AVHnY4JWQFPP4i3Y1Vsk1tHJ3qdczXTXtOETSkHmLLIKPU6ZdxxzC_L9np0-4OY
Message-ID: <CAMRc=Mc5bj05ThOMy7eguS9+tPHkevWc3ArYzcQqvB6SrXpO4w@mail.gmail.com>
Subject: Re: [PATCH] gpio: mt7621: fix interrupt banks mapping on gpio chips
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linusw@kernel.org, brgl@kernel.org, tglx@kernel.org, 
	grant.likely@secretlab.ca, anna-maria@linutronix.de, vicencb@gmail.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,secretlab.ca,linutronix.de,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37563-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 002135E157D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 26 May 2026 15:12:43 +0200, Sergio Paracuellos
<sergio.paracuellos@gmail.com> said:
>
> Device tree is using two cells for this, so only the interrupt pin and the
> interrupt type are described there. Changing to have three cells to setup
> also the bank and implement 'of_node_instance_match()' would also work but
> this would be an ABI breakage and also a bit incoherent since gpios itself
> are also using two cells and properly mapped in desired bank using through
> its pin number on 'of_xlate()'.
>
> That said, the solution adopted here is registering register a linear IRQ

s/registering register/registering/ but better just use imperative tone:
"Register a linear IRQ..."

...

>  	for (i = 0; i < MTK_BANK_CNT; i++) {
> @@ -331,7 +466,17 @@ mediatek_gpio_probe(struct platform_device *pdev)
>  			return ret;
>  	}
>
> +	if (mtk->gpio_irq > 0) {
> +		ret = mt7621_gpio_irq_setup(pdev, mtk);
> +		if (ret)
> +			goto fail;
> +	}
> +
>  	return 0;
> +
> +fail:
> +	mt7621_gpio_remove(pdev);

Don't you need to undo this in remove path as well?

The approach looks sane to me. I'll give some time for tglx or linusw to
respond before queueing it for fixes.

Bart

