Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 088B735DD8B
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Apr 2021 13:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345308AbhDMLOQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Apr 2021 07:14:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345300AbhDMLOP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Apr 2021 07:14:15 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D638C061574
        for <linux-gpio@vger.kernel.org>; Tue, 13 Apr 2021 04:13:54 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id j5so15056611wrn.4
        for <linux-gpio@vger.kernel.org>; Tue, 13 Apr 2021 04:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=Cu3neruluoSCQXicI1kgn+ehmqNJHkuNyetxZuBFmfY=;
        b=hfiiqOLquAbv0Zo8WwVW2P07q1yK3rArOdZiB3bFdqqgKEY4lhM+0k9N7CEc6B7dmD
         //pm3E0tK9HCL2QxUb6/PVLhUGdQc10kea72DZarCyaqCO0WxxJqcCLQmwn7hJEkjfoH
         2Iiqt6IqBtzKI9PfTgrsHx2BGKb2PpShkXb0fjnkpqqjDf78j39yJlk3ZbEDkvgPa93c
         2/cJipB4xQ+mHSaKtRMPfX/Lxs8cPxa8S+O7QT1OJ0UHk1/ZbjFuQ8awzP/0P8bG1Q6w
         hzU5VD/Pn9vta+7UKZmMtV44h1AS9WC2Ii173EYi71sMGuGasWPvDVwjcwUHvycImZde
         gRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=Cu3neruluoSCQXicI1kgn+ehmqNJHkuNyetxZuBFmfY=;
        b=U+dzeiJr7LpccsxkhD+7Ggykwx3yGu6gv6GXgGqyqgqM/SoRpIYA4B4/FcYYQAeawp
         GpwY/FiObdTlHUDRBcwMD5/KHbts3BvI6wphYNTgQxSAIiKWIhXcgpDEQjGcHxRdkWw1
         c7hLPBBFV8HssR3CzvQujxf+3sjXuYW9IygHFcjpLVQHwDYynDgYmVRAuOkoIbcMm90V
         hmn8o01cUK8FxPGhvGdnaSd4YMiztl5n1bhicpvDGv7fM7PQoTCHdt3R1XNRWCRm63CX
         sbE6umx+oEuksiBm8Tb3ca0FKnz9VgtxeY4WlEImeHT6X1lvkY2g9kHtpep61aDWSvzs
         PU6g==
X-Gm-Message-State: AOAM531iEX4TUb3HyhF+udlqHqhgYewZ4tiQQ1ADsxEAJBBAErmHulff
        N/x42kdLCGRVItm86LHp8eBKEw==
X-Google-Smtp-Source: ABdhPJzY9shCczKjSRW6Y2rpwOvSTMSuxueUgRqhkgPrE9aInqm3+aebb0vYVhHDuo9TmXBtfSBYUQ==
X-Received: by 2002:a5d:43c1:: with SMTP id v1mr11267064wrr.419.1618312432810;
        Tue, 13 Apr 2021 04:13:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id j6sm2130276wmq.16.2021.04.13.04.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 04:13:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
        by zen.linaroharston (Postfix) with ESMTP id 012321FF7E;
        Tue, 13 Apr 2021 12:13:50 +0100 (BST)
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <8209ce55-a4aa-f256-b9b9-f7eb3cac877b@redhat.com>
 <43f1ee89-89f3-95a3-58f1-7a0a12c2b92f@metux.net>
User-agent: mu4e 1.5.11; emacs 28.0.50
From:   Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
        corbet@lwn.net, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, mst@redhat.com,
        linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org,
        Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
Date:   Tue, 13 Apr 2021 12:07:58 +0100
In-reply-to: <43f1ee89-89f3-95a3-58f1-7a0a12c2b92f@metux.net>
Message-ID: <87lf9mmo7l.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


"Enrico Weigelt, metux IT consult" <info@metux.net> writes:

> On 04.12.20 04:35, Jason Wang wrote:
>
> Hi,
>
>> Is the plan to keep this doc synced with the one in the virtio
>> specification?
>
> Yes, of course. I'm still in progress of doing the beaurocratic stuff w/
> virtio-tc folks (ID registration, ...) - yet have to see whether they
> wanna add it to their spec documents ...
>
> BTW: if you feel, sometings not good w/ the current spec, please raise
> your voice now.
>
>> I think it's better to use u8 ot uint8_t here.Git grep told me the
>> former is more popular under Documentation/.
>
> thx, I'll fix that
>
>>> +- for version field currently only value 1 supported.
>>> +- the line names block holds a stream of zero-terminated strings,
>>> +=C2=A0 holding the individual line names.
>>=20
>> I'm not sure but does this mean we don't have a fixed length of config
>> space? Need to check whether it can bring any trouble to
>> migration(compatibility).
>
> Yes, it depends on how many gpio lines are present and how much space
> their names take up.
>
> A fixed size would either put unpleasent limits on the max number of
> lines or waste a lot space when only few lines present.
>
> Not that virtio-gpio is also meant for small embedded workloads running
> under some hypervisor.
>
>>> +- unspecified fields are reserved for future use and should be zero.
>>> +
>>> +------------------------
>>> +Virtqueues and messages:
>>> +------------------------
>>> +
>>> +- Queue #0: transmission from host to guest
>>> +- Queue #1: transmission from guest to host
>>=20
>>=20
>> Virtio became more a popular in the area without virtualization. So I
>> think it's better to use "device/driver" instead of "host/guest" here.
>
> Good point. But I'd prefer "cpu" instead of "driver" in that case.

I think you are going to tie yourself up in knots if you don't move this
to the OASIS spec. The reason being the VirtIO spec has definitions for
what a "Device" and a "Driver" is that are clear and unambiguous. The
upstream spec should be considered the canonical source of truth for any
implementation (Linux or otherwise).

By all means have the distilled documentation for the driver in the
kernel source tree but trying to upstream an implementation before
starting the definition in the standard is a little back to front IMHO*.

* that's not to say these things can't be done in parallel as the spec
  is reviewed and worked on and the kinks worked out but you want the
  final order of upstreaming to start with the spec.

--=20
Alex Benn=C3=A9e
