Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A78401FC3EC
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2020 03:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726497AbgFQB5Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 21:57:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbgFQB5Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 21:57:25 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0447CC061573
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 18:57:24 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id i12so258573pju.3
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 18:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=z3/+bArydSiYPOKHGUO2dyX2nQqzHx6FwmuKiJRTfUk=;
        b=FDHRVzpcm5kRuzcRSiBoqwdQpApQMauYy15T06SAU2DB0LbJnyfdFE3d8Tr5O5ZqYi
         vzikje0F/lWkngdhJ2JxF7tJjgpp5Q9kpGpwRfwFgEssGGU65QRmdebA0I3Iz6OGTlb8
         JN2YGzjlkYE/zVoZvmjRKrHCgpIc8D2FTtCribHz0W3NMQplgSwEP0pM189J9O4vdhyx
         bvQ+V/T9bDBY/jK+hq7Ei8U5AE0BKEfsJ7+mt5JfmAGpzfGkY+cIIGkAOD+xDd+h5Rui
         rUEThQpzZYoq+LhM+4dVITPd3h9NnvaZ6yxa0Sji3eo7aT8b5Nho9bg2VNpwfPIpYYYY
         X0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=z3/+bArydSiYPOKHGUO2dyX2nQqzHx6FwmuKiJRTfUk=;
        b=rEq1vrOlQsn+m0AzBXTGVoS2jqKVGmx5Pkx3wwXwn/yOYBB6GbqproriYHaOSfyoi1
         3FNKks9OXjLFyb+D27DZgzqbZx9XtXhsah6fG5AclK6scOJz3B9bRUzvpgG1acS6znkQ
         rmm8qbdVMkkyyzivPV4nrwr5jLuXlS1upz40/nn95R//sVKD89zL0gAlcIRk85+J2N1c
         o6NYSguTqLj7Uwjey1ac1tEh1pnuOXRrRnGG1gcoRn6rvBYraXNsdm05UUDLUxQTxzyH
         mfBplkngMijgtJWZabGFKgB7FDyurH51nDmxns5oEd3DRVZqNxd62+Uxfhs1kU97Llso
         TVXA==
X-Gm-Message-State: AOAM533ra/oQ2ev2TTS8TnsVNn1Ulw8h55i9KT71uYPIATt1Xnfp0Pfh
        FuP/rHQ+0N6sHvyOlwLgC28F0JiZzos=
X-Google-Smtp-Source: ABdhPJwTfPiESXp73ADcJFfq0svfPbjwYazNiPTa7sMOcvogW2TnSvAg3ujDoSjNbPj2NgSWBj7W6w==
X-Received: by 2002:a17:902:ea8a:: with SMTP id x10mr4599391plb.330.1592359043378;
        Tue, 16 Jun 2020 18:57:23 -0700 (PDT)
Received: from sol (220-235-93-205.dyn.iinet.net.au. [220.235.93.205])
        by smtp.gmail.com with ESMTPSA id y10sm15738652pgi.54.2020.06.16.18.57.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 18:57:22 -0700 (PDT)
Date:   Wed, 17 Jun 2020 09:57:17 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Gerrit Wyen <ml@ionscale.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod] reading multiple lines after edge event
Message-ID: <20200617015717.GA16394@sol>
References: <a21e051a-805b-4c26-6f47-99f1654f222b@ionscale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a21e051a-805b-4c26-6f47-99f1654f222b@ionscale.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 15, 2020 at 09:39:45PM +0200, Gerrit Wyen wrote:
> Hi,
> 
> can someone explain the following behavior and whether it is a bug?
> 
> When reading two lines at once via get_values() in response to an edge event
> I only receive the correct value for the first line (second line is high
> during the test but always reported as low).
> See example code below:
> 
> lines.request({
>  “gpiotest”, ::gpiod::line_request::EVENT_BOTH_EDGES,
>  0,
> });
> 
> auto events = lines.event_wait(::std::chrono::seconds(10));
> if (events) {
>  auto values = lines.get_values();
>  for (auto& it: values) {
>    ::std::cout << it;
>    }
>  }
> 
> However reading the same lines via get_value() one by one after the event
> works correctly. Like so:
> 
> for (auto& it: lines) { ::std::cout << it.get_value(); }
> 
> 
> Also, when reading them without waiting for the event with
> line_request::DIRECTION_INPUT  the correct values are returned by
> get_values() as well as by get_value().
> 
> This behavior was tested on multiple different devices.
> 
> 

I have written some test cases and can confirm that behaviour
with libgpiod v1.5.

When you request the lines with DIRECTION_INPUT, libgpiod is using a
linehandle (which works), but with EVENT_BOTH_EDGES it is using
a collection of linevents (which doesn't).

I would consider that a bug - linehandles (lines without edge detection)
and lineevents (lines with edge detection) are treated differently
in the GPIO uAPI and libgpiod should be hiding that from you - and is
failing to do that.

The issue here is that the underlying function that retrieves the values,
gpiod_line_get_value_bulk, assumes it is dealing with a linehandle
that can be read in bulk by the kernel, not a collection of lineevents
that must be read individually, so it is only getting the value of the
first line in the set.  It should be getting the event lines
individually, as you are, and collecting those values into the response.

Until there is a fix, the workaround is to read the event lines
individually - as you have already discovered.

Cheers,
Kent.
