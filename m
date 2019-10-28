Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF15E7208
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2019 13:46:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727802AbfJ1Mpw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Oct 2019 08:45:52 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34961 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727316AbfJ1Mpw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Oct 2019 08:45:52 -0400
Received: by mail-wr1-f67.google.com with SMTP id l10so9737938wrb.2
        for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2019 05:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EjO3nRtZRcHpq4gF9qTCncUdsLaN7JBougyYjcKY6iQ=;
        b=ZoLU5m9GxdnwffSu0EW6y0pGEJD2St4BW1Or90pLKllhPiB4f1Di9B3e3e2mqGJjsq
         jsFx8WAxwcc9s/0IgrizLkXgBV5lcpT33SA8sFf2vGjv3kjC/qpC305pVj/XYl/YtpcI
         D6nlH9i0hwED/+2q7/04OYEVNE5pBpqM8rAZrlokoBQb1PeN69+gkewQ756V439YAp8r
         u37qbi4DkpziBHivr9HsgQ1VD9bcuK/oBIqFaia7N/bgibq5DGJDdqU/Tai48T7XcTVr
         OG7fyw4BHSSwOa1jfqymyccf2xA1Vq8/e+ECfuMMcK5s9tDdJjwk3JnJqopKM5cFSC4E
         VltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EjO3nRtZRcHpq4gF9qTCncUdsLaN7JBougyYjcKY6iQ=;
        b=RTaNg+vkFz1wcCZoyg0aSRkh9ogFbDWZ9ubsc3Aifvo5x9l+Kd8AXlTwU+tw4aimLC
         howqRrcJkLO6FGkgfbSug9YsmDzI5Q4TcTAFMLGiQYoOgB/SEBmiTZlLzCbLWjCklLkl
         jjcUhTYdpLkQK+MUnncM08n2XiZdqjfkvc2lQzX6d9N9B6sLS5SCFU1qOxy0kj3d0gvp
         N9m3lYiTqk9sEtXObcRKBWjkV1ksALSO+yBjX4idCD0PNZrsyi7GvgpY5/6AyWfC9FZs
         2Z7uj4aZyFzNfk9Qz2JR0CEQO/v/qOzgGm7UoQrCwSRjAZ3Ed/BZgHNn1emSi0ZxtFKT
         +Suw==
X-Gm-Message-State: APjAAAU/H6JMUqvwoqhwFgsXeCbvdrG4j4XwvW+c+EhHv1xHyQwuk7CO
        pskOVu+oukSXjkKGJKzp0B5wny1DyhA=
X-Google-Smtp-Source: APXvYqx5GBghFKmvy0FXn9fEAyKJ8U0QQT5f2YmoThu0wU+QHGSds58+7CTsU7u+9MwQhikla46hCQ==
X-Received: by 2002:adf:8011:: with SMTP id 17mr15418613wrk.367.1572266743355;
        Mon, 28 Oct 2019 05:45:43 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id d2sm16183996wmd.2.2019.10.28.05.45.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Oct 2019 05:45:42 -0700 (PDT)
Subject: Re: [PATCH v2 01/11] ASoC: dt-bindings: add dt bindings for
 WCD9340/WCD9341 audio codec
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     broonie@kernel.org, linus.walleij@linaro.org, lee.jones@linaro.org,
        vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
 <20191018001849.27205-2-srinivas.kandagatla@linaro.org>
 <20191025204338.GA25892@bogus>
 <90b2d83b-f2b2-3a5d-4deb-589f4b48b208@linaro.org>
Message-ID: <371955d9-ad2d-5ddc-31b4-710729feae42@linaro.org>
Date:   Mon, 28 Oct 2019 12:45:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <90b2d83b-f2b2-3a5d-4deb-589f4b48b208@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 28/10/2019 12:40, Srinivas Kandagatla wrote:
> Its Phandle.
> 
> something like this is okay?
> 
> slim-ifc-dev:
>    $ref: '/schemas/types.yaml#/definitions/phandle-array'

Sorry this should not be an array, so something like this:

   slim-ifc-dev:
     description: SLIMBus Interface device phandle
     $ref: '/schemas/types.yaml#/definitions/phandle'


>    description: SLIMBus Interface device phandle
