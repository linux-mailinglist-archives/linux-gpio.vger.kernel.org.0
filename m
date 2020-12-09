Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 258C12D3EDE
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 10:35:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729352AbgLIJdi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 04:33:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44091 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729348AbgLIJd2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 04:33:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607506322;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=W6cW4CaC6vRkex8b1uivDQizxuPVFLQvTcxdJxTGoT8=;
        b=deHDM0ijhpV3OkJR/4d/wPKnEiV5EtZooLGT5bWxKyjKG6D/hFo9Fd1woCmumn+WPvLuyA
        a8kgE2jFlZKzixHbC1YaNhjrVR2yKFusXNEN/CrvaEcUddh5wN6gRn7t+A+77hLlXXAj3B
        0qA5A/ToYjknbMvHDTvhmxAXm3f3tj4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-mt-nlmTxMZmaliXtXLKgmg-1; Wed, 09 Dec 2020 04:31:58 -0500
X-MC-Unique: mt-nlmTxMZmaliXtXLKgmg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A079802B40;
        Wed,  9 Dec 2020 09:31:56 +0000 (UTC)
Received: from [10.72.12.31] (ovpn-12-31.pek2.redhat.com [10.72.12.31])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 89EBE5275D;
        Wed,  9 Dec 2020 09:31:42 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        "Michael S. Tsirkin" <mst@redhat.com>
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org, stefanha@redhat.com,
        msuchanek@suse.de
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <8209ce55-a4aa-f256-b9b9-f7eb3cac877b@redhat.com>
 <96aca1e6-2d5a-deb1-2444-88f938c7a9de@metux.net>
 <20201205142218-mutt-send-email-mst@kernel.org>
 <842519cc-94ca-3c11-ddd6-543e5a89c998@redhat.com>
 <20201207085247-mutt-send-email-mst@kernel.org>
 <0a9c19bd-0d25-1035-57e3-b1f5f204c309@redhat.com>
 <500d0c68-0c6d-f5fb-665b-74aec6d59f99@metux.net>
From:   Jason Wang <jasowang@redhat.com>
Message-ID: <9e11f1ab-6b7c-d50e-d7db-633ebc3d358c@redhat.com>
Date:   Wed, 9 Dec 2020 17:31:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <500d0c68-0c6d-f5fb-665b-74aec6d59f99@metux.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 2020/12/8 下午3:02, Enrico Weigelt, metux IT consult wrote:
> On 08.12.20 03:36, Jason Wang wrote:
>
> Hi,
>
>> So we endup with two solutions (without a prompt):
>>
>> 1) using select, user may end up with driver without transport
> IMHO not an entirely unusual situation in other places of the kernel,
> eg. one can enable USB devices, w/o having an usb host adapter enabled.
>
> And even if some USB-HA driver is enabled, the actualy machine doesn't
> necessarily have the corresponding device.


Ok, then select works for me.


>
>> 2) using depends, user need to enable at least one transport
>>
>> 2) looks a little bit better I admit.
> So, all virtio devices should depend on TRANSPORT_A || TRANSPORT_B ||
> TRANSPORT_C || ... ? (and also change all these places if another
> transport is added) ?


I think not. The idea is, if none of the transport (select VIRTIO) is 
enabled, user can not enable any virtio drivers (depends on VIRTIO).

Thanks


>
> --mtx
>

