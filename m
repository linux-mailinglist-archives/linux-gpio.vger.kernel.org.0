Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6C98ECCF0
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Nov 2019 03:55:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727637AbfKBCzu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Nov 2019 22:55:50 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:39111 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbfKBCzu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Nov 2019 22:55:50 -0400
Received: by mail-pg1-f196.google.com with SMTP id p12so7587993pgn.6;
        Fri, 01 Nov 2019 19:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xFTNRYksg5hjJmBCliKtQprKj5dj8NPap0MuwQWTDx4=;
        b=JzZ54Ca/aYsIg4kl18Pwqdb56A5YbfqFYibHegzjtPq+/nX8Jjnlx/bGP2fg4zmtwo
         9xDBCMkAHy7y4Xdz9M9qSFy82GikNWN5LpelPlZx5XdwhziozECm7OoX7alN6A8m0X6u
         r4qKj0mKq4G297mGlLafNrWWjo9yceMvuUh0wMF68fopww0lGjjLjdFOALD2wEXiEihp
         Auhf9xfLG7yc8vaWgNvjwfNI7SxPj09U9GIlSQP4zFQTNES9deSfyvRgFOIlQuZNKBy+
         +bykio1h3I2Z95fvIYqXzjvFzj/cRH/+JkJd/odg6JGebDGcB9b8xdBcH3EToVhG1iXF
         IpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xFTNRYksg5hjJmBCliKtQprKj5dj8NPap0MuwQWTDx4=;
        b=BCLSO7MvFTHa9UJfjYzW43BIVWB9d0WMaC30H5/Qta3UNFGnZJ6p0wugKAA87FSLco
         cfUKwHDajSiIpzNFedUUqzxuK3oqq3Aob6PId45TZDbdHHOfXy+xydpcHGt//hFQfBQP
         if5svLd8cXx4TkcMr3BQyenCRaowTXO84IdZTKMPEb8zBSu0qqUdp5YwMw6tYhyuPP6u
         b3PNDMPyPGXbIHH+M82sLdnujO8/uhO+sEUysRRkWpvHkqnRkiEbtji62/3P+GnsKUwF
         V6wCwfVeutwfcwV4fWf5FmMpLPSDYonq9kqDxnJIrTBKZ4bgx7PJLh+IWek6yGke2iHE
         EhkA==
X-Gm-Message-State: APjAAAWIiNUar3OPuWxT1+DvZrOCAPYE2GojJ46t657WCzOSOd6IKZcY
        bl0Qen6RclVjcbVpdGMU6Yo=
X-Google-Smtp-Source: APXvYqzeyJwMJ3x8rKK5HX81hTOz8v7spnlXbx1lkmavVOINNHDRP65dyZnjDg9DB0XkFShAoj29Cw==
X-Received: by 2002:a17:90a:9291:: with SMTP id n17mr19824023pjo.60.1572663349847;
        Fri, 01 Nov 2019 19:55:49 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id a12sm3441851pfo.136.2019.11.01.19.55.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2019 19:55:49 -0700 (PDT)
Subject: Re: [PATCH 2/2] pinctrl: bcm: nsp: implement get_direction
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linus.walleij@linaro.org, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20191101015621.12451-1-chris.packham@alliedtelesis.co.nz>
 <20191101015621.12451-3-chris.packham@alliedtelesis.co.nz>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <3cc0fc66-c6da-45ba-c2d5-32877a180b57@gmail.com>
Date:   Fri, 1 Nov 2019 19:55:48 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191101015621.12451-3-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 10/31/2019 6:56 PM, Chris Packham wrote:
> The get_direction api is strongly recommended to be implemented. In fact
> if it is not implemented gpio-hogs will not get the correct direction.
> Add an implementation of get_direction for the nsp-gpio driver.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

-- 
Florian
