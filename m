Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2172E2D400C
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 11:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730167AbgLIKff (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 05:35:35 -0500
Received: from mx2.suse.de ([195.135.220.15]:51784 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730156AbgLIKff (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 9 Dec 2020 05:35:35 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id BC698AB63;
        Wed,  9 Dec 2020 10:34:53 +0000 (UTC)
Date:   Wed, 9 Dec 2020 11:34:52 +0100
From:   Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
        corbet@lwn.net, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org, stefanha@redhat.com
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
Message-ID: <20201209103452.GH6564@kitsune.suse.cz>
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <8209ce55-a4aa-f256-b9b9-f7eb3cac877b@redhat.com>
 <96aca1e6-2d5a-deb1-2444-88f938c7a9de@metux.net>
 <20201205142218-mutt-send-email-mst@kernel.org>
 <20201208101051.GC6564@kitsune.suse.cz>
 <dcc41cf3-ab2d-656e-6fa3-73f231bde92d@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dcc41cf3-ab2d-656e-6fa3-73f231bde92d@metux.net>
User-Agent: Mutt/1.11.3 (2019-02-01)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 08, 2020 at 01:33:02PM +0100, Enrico Weigelt, metux IT consult wrote:
> On 08.12.20 11:10, Michal Suchánek wrote:
> 
> Hi,
> 
> > The console driver provides early console which should initialize
> > without any transport. I have not tested it actually works but the code
> > seems to be there to support this use case.
> 
> What does it do if it hasn't got any transport yet ?
> 
> Just eat the bits or buffer everything, until it gets a transportport
> and sends out later ?

Why would it need the transport?

It's not like the data goes through an actual PCI bus, it is only used
for discovering and configuring the device, right?

Then if you do ad-hoc configuration of the device you do not need the
trasport at all.

Thanks

Michal
