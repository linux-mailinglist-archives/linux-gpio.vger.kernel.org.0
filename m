Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2647B2C912D
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Nov 2020 23:34:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730744AbgK3WeQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 17:34:16 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:51410 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730741AbgK3WeP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 17:34:15 -0500
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1606775613;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Mm7z8+LQNmpqR3/51ygd5ccUSxfGw1mG3mvRt4yFQJc=;
        b=wy/wct3OdzxqH87mZ8U35WXS8YHdfm2FzpA6J1iXgNuazw7m2Gm1nOJyNA+eXh4y49E8xD
        hbTN1gqi/zWyeh4p3SjPXMm6HslikbmaTtfKzQn4RSVLhiJhQfeyGUQ0JsA2jMC/Ue7Frw
        Lk2fPYkJwI0K/wDBcij7KrLZu+awwdIR/F/gX8kPPyfASwV6t2wAAbzArXEsB16ubqvBX/
        M80xQ13aSOs491Jc3IIuPC/JazN6blWKZ2O/d4TQfXoHlSttBgwynNIQcornI92e+S9hAK
        IObQcadw6KYEWaKsQS3UbWCTxMlQqJoIVRUt2wObT0aTArG8qOKWOB9dR8SL5A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1606775613;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Mm7z8+LQNmpqR3/51ygd5ccUSxfGw1mG3mvRt4yFQJc=;
        b=XY7Bodsgz1q+NQjLQMpVRYw72W7/aL9naYJ1Niv9vjB1Ci877/KySl8fwhkuMojdh+eAmw
        eso+VrublYa7j6BQ==
To:     Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org
Cc:     =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
        Frederic Barrat <fbarrat@linux.ibm.com>,
        Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>,
        Oliver O'Halloran <oohall@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
        Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel v4 5/8] genirq: Add free_irq hook for IRQ descriptor and use for mapping disposal
In-Reply-To: <877dq2ij45.fsf@nanos.tec.linutronix.de>
References: <20201124061720.86766-1-aik@ozlabs.ru> <20201124061720.86766-6-aik@ozlabs.ru> <877dq2ij45.fsf@nanos.tec.linutronix.de>
Date:   Mon, 30 Nov 2020 23:33:33 +0100
Message-ID: <87360qiif6.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 30 2020 at 23:18, Thomas Gleixner wrote:
> On Tue, Nov 24 2020 at 17:17, Alexey Kardashevskiy wrote:
>> We want to make the irq_desc.kobj's release hook free associated resources
>> but we do not want to pollute the irqdesc code with domains.
>
> Can you please describe your changelog in factual ways without 'we and I
> and want'? See Documentation/process/

And while we are at process. MAINTAINERS clearly says:

IRQ DOMAINS (IRQ NUMBER MAPPING LIBRARY)
T:      git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core

IRQ SUBSYSTEM
T:      git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core

So why are these patches not applying against that git branch?

Thanks,

        tglx






 
