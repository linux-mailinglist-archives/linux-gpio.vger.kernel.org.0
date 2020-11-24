Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 781B02C2E99
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Nov 2020 18:32:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390637AbgKXRcB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Nov 2020 12:32:01 -0500
Received: from 9.mo51.mail-out.ovh.net ([46.105.48.137]:43264 "EHLO
        9.mo51.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728749AbgKXRcA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Nov 2020 12:32:00 -0500
X-Greylist: delayed 1808 seconds by postgrey-1.27 at vger.kernel.org; Tue, 24 Nov 2020 12:32:00 EST
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.148])
        by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 45AE023CE84;
        Tue, 24 Nov 2020 17:54:18 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 24 Nov
 2020 17:54:16 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-105G006f441115f-3859-42e7-9d6d-ccd259b89853,
                    970ACD818314199E15927CBC8014A4D4C9EA8B7B) smtp.auth=clg@kaod.org
Subject: Re: [PATCH kernel v4 1/8] genirq/ipi: Simplify irq_reserve_ipi
To:     Alexey Kardashevskiy <aik@ozlabs.ru>,
        <linux-kernel@vger.kernel.org>
CC:     Marc Zyngier <maz@kernel.org>, <x86@kernel.org>,
        <linux-gpio@vger.kernel.org>, Oliver O'Halloran <oohall@gmail.com>,
        Frederic Barrat <fbarrat@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
        <linuxppc-dev@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Matt Redfearn <matt.redfearn@mips.com>,
        Qais Yousef <qsyousef@gmail.com>, <linux-mips@linux-mips.org>
References: <20201124061720.86766-1-aik@ozlabs.ru>
 <20201124061720.86766-2-aik@ozlabs.ru>
From:   =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d12fcee6-f83a-5b09-6208-face2ea5ec39@kaod.org>
Date:   Tue, 24 Nov 2020 17:54:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201124061720.86766-2-aik@ozlabs.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: abd77706-b6fe-4c7a-b8f7-b22673109b15
X-Ovh-Tracer-Id: 4231413326248905534
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudegkedgleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegrihhksehoiihlrggsshdrrhhu
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11/24/20 7:17 AM, Alexey Kardashevskiy wrote:
> __irq_domain_alloc_irqs() can already handle virq==-1 and free
> descriptors if it failed allocating hardware interrupts so let's skip
> this extra step.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

LGTM,

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Copying the MIPS folks since the IPI interface is only used under arch/mips.

C.
 
> ---
>  kernel/irq/ipi.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/kernel/irq/ipi.c b/kernel/irq/ipi.c
> index 43e3d1be622c..1b2807318ea9 100644
> --- a/kernel/irq/ipi.c
> +++ b/kernel/irq/ipi.c
> @@ -75,18 +75,12 @@ int irq_reserve_ipi(struct irq_domain *domain,
>  		}
>  	}
>  
> -	virq = irq_domain_alloc_descs(-1, nr_irqs, 0, NUMA_NO_NODE, NULL);
> -	if (virq <= 0) {
> -		pr_warn("Can't reserve IPI, failed to alloc descs\n");
> -		return -ENOMEM;
> -	}
> -
> -	virq = __irq_domain_alloc_irqs(domain, virq, nr_irqs, NUMA_NO_NODE,
> -				       (void *) dest, true, NULL);
> +	virq = __irq_domain_alloc_irqs(domain, -1, nr_irqs, NUMA_NO_NODE,
> +				       (void *) dest, false, NULL);
>  
>  	if (virq <= 0) {
>  		pr_warn("Can't reserve IPI, failed to alloc hw irqs\n");
> -		goto free_descs;
> +		return -EBUSY;
>  	}
>  
>  	for (i = 0; i < nr_irqs; i++) {
> @@ -96,10 +90,6 @@ int irq_reserve_ipi(struct irq_domain *domain,
>  		irq_set_status_flags(virq + i, IRQ_NO_BALANCING);
>  	}
>  	return virq;
> -
> -free_descs:
> -	irq_free_descs(virq, nr_irqs);
> -	return -EBUSY;
>  }
>  
>  /**
> 

