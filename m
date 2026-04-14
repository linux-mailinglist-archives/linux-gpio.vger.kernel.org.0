Return-Path: <linux-gpio+bounces-35153-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AE2bJhBL3mkzqAkAu9opvQ
	(envelope-from <linux-gpio+bounces-35153-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 16:11:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 414EE3FAE6D
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 16:11:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47856302416F
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 14:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F1923E7169;
	Tue, 14 Apr 2026 14:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XRQYte4a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513543A4F37;
	Tue, 14 Apr 2026 14:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776175505; cv=none; b=cJ4hXGrqFB08LXuiI6+BHaqOTckErJHp/9uYo85T6Z5vpoPef7e69Su3xGTjtKKN4kXXfsxB2h6mJ5ujbknHOcS76marJgTrCRmD6UPi4gbZVvfj9G9Y3cFD2qxirRdPRxm44tx1h0909WsPFGoarhVDhh0LEaN+GDbDCMy509w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776175505; c=relaxed/simple;
	bh=OF74E1jQi9q8RugvWARpV7zDv+GE0MY3No45lifQv/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N4WjZd0yj6LnoY1tIqY2YZ6oPcYOgSeHwSwfhHQC1xUf3njs7HUvsEsDHXBmOUH1iU046dgQSLBwfLmEu9TfbebI8jyhNHMni8Ss6KrPqeAoGSkjkdeXFnqi+W2k4e1Ud8+kAArPfqPCxHD5tPew6/FwBcaMS2MG3Naw16dFwQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XRQYte4a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9C0C19425;
	Tue, 14 Apr 2026 14:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776175504;
	bh=OF74E1jQi9q8RugvWARpV7zDv+GE0MY3No45lifQv/4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XRQYte4arHLokcDvFI9HBWgNA9wtDMJVYVJbkgQeM2bC47GJWfUNsI4BoF5ra/O8D
	 bAh6VdqSSceAQeK4BW1KcIJDDxbp3mthjclhC8Kc1c7wFfoFNCot5w09okpk6ZOVQD
	 /pItKbut6ccWoajFKFZ2XWijoqG1s2nshmzdA/nfB4VSyou7tGxjAOxLuoNk1Bn+5q
	 Fgu/vk9cAMDWElgaYzZpHA6EBs7GtLtXCPQ9k8K+SGQdwFVTibwShZuw23DZk9rH6G
	 UrRxl/x3RuLoD/xry8YYLU6yj8rBQH21z2pL6nkSiQXE3/cJbLlh9sd6mmKOoxI2sB
	 LUWCi73Ox/S1g==
Message-ID: <247a2a55-14e5-469b-908a-54ffebe035d8@kernel.org>
Date: Tue, 14 Apr 2026 16:04:59 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] gpio: axiado: add SGPIO controller support
To: Petar Stepanovic <pstepanovic@axiado.com>, Tzu-Hao Wei <twei@axiado.com>,
 Swark Yang <syang@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
 SriNavmani A <srinavmani@axiado.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260414-axiado-ax3000-sgpio-controller-v1-0-b5c7e4c2e69b@axiado.com>
 <20260414-axiado-ax3000-sgpio-controller-v1-2-b5c7e4c2e69b@axiado.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260414-axiado-ax3000-sgpio-controller-v1-2-b5c7e4c2e69b@axiado.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35153-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 414EE3FAE6D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 14/04/2026 15:48, Petar Stepanovic wrote:
> +
> +	for (i = 0; i < sgpio->max_offset_regs; i++) {
> +		sgpio->slices[2].reg_ss[i] = 0;
> +		dout_value = be32_to_cpu(prop[i]);
> +
> +		for (dout_reverse = 0; dout_reverse < 32; ++dout_reverse) {
> +			sgpio->slices[2].reg_ss[i] <<= 1;
> +			sgpio->slices[2].reg_ss[i] |= (dout_value & 1);
> +			dout_value >>= 1;
> +		}
> +	}
> +
> +	sgpio_hw_init(sgpio);
> +
> +	irq = platform_get_irq(pdev, 0);
> +

Odd style

> +	if (irq < 0) {
> +		dev_err(&pdev->dev, "Failed to get parent IRQ: %d\n", irq);
> +		return irq;
> +	}
> +	/* Store parent IRQ for cleanup */
> +	sgpio->parent_irq = irq;
> +
> +	rc = devm_request_threaded_irq(&pdev->dev, irq, NULL, sgpio_irq_handler,
> +				       IRQF_ONESHOT, "axiado-sgpio", sgpio);
> +
> +	if (rc < 0) {
> +		dev_err(&pdev->dev, "Failed to request threaded IRQ %d: %d\n",
> +			irq, rc);

Nope

> +		return rc;
> +	}
> +
> +	sgpio->chip.parent = &pdev->dev;
> +	sgpio->chip.ngpio = sgpio->ngpios * 2;
> +	sgpio->chip.owner = THIS_MODULE;
> +	sgpio->chip.direction_input = ax3000_sgpio_dir_in;
> +	sgpio->chip.direction_output = ax3000_sgpio_dir_out;
> +	sgpio->chip.get = ax3000_sgpio_get;
> +	sgpio->chip.set = ax3000_sgpio_set;
> +	sgpio->chip.label = dev_name(&pdev->dev);
> +	sgpio->chip.base = -1;
> +
> +	girq = &sgpio->chip.irq;
> +
> +	girq->chip = &axiado_sgpio_irqchip;
> +	girq->handler = handle_edge_irq;
> +	girq->default_type = IRQ_TYPE_NONE;
> +	girq->num_parents = 1;
> +	girq->parents =
> +		devm_kcalloc(&pdev->dev, 1, sizeof(*girq->parents), GFP_KERNEL);
> +	if (!girq->parents) {
> +		dev_err(&pdev->dev, "Failed to allocate parents array\n");
> +		return -ENOMEM;

Ykes...

> +	}



> +
> +static struct platform_driver sgpio_driver = {
> +	.driver = {
> +		.name = "sgpio",
> +		.owner = THIS_MODULE,

Uh, that's 13 year old code. Please drop everything and write from
scratch using latest reviewed drivers as your base. No point to repeat
same review and fix the same issues we already fixed during last 13 years...

> +		.of_match_table = ax_sgpio_match,
> +	},
> +	.probe = sgpio_probe,
> +	.remove = sgpio_remove,
> +};
> +
> +static int __init ax_sgpio_init(void)
> +{
> +	int ret;
> +
> +	ret = platform_driver_register(&sgpio_driver);
> +	if (ret < 0) {
> +		pr_err("Failed to register SGPIO driver\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void __exit ax_sgpio_exit(void)
> +{
> +	platform_driver_unregister(&sgpio_driver);
> +}
> +
> +module_init(ax_sgpio_init);
> +module_exit(ax_sgpio_exit);

And that's one more.

module_platform_driver, no?

> +
> +MODULE_DESCRIPTION("Axiado Serial GPIO Driver");
> +MODULE_AUTHOR("Axiado Corporation");
> +MODULE_LICENSE("GPL");
> 


Best regards,
Krzysztof

