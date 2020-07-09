Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D58E7219EFA
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2020 13:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbgGILTG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 07:19:06 -0400
Received: from mail-ed1-f42.google.com ([209.85.208.42]:38698 "EHLO
        mail-ed1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726538AbgGILTG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2020 07:19:06 -0400
Received: by mail-ed1-f42.google.com with SMTP id n2so1492728edr.5
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2020 04:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=aRyCLZvDjIHHvv8UBua9/z3UKk8yfnk74cI3YfuknEU=;
        b=nYI+th12YGzlakCcmUcJeqy41RVruuYw8aIwoUrDpD+JgyOFrNa3zoj0lUix7PhkLD
         SxQHfayo3rOieDvbj55D+ISaGAG444EOj9PRYXpJqovOUMtd5g8mTHKzePAVid0o2PEG
         VSkAmKJMMNB2R4fpI4u3Pz6UI4CxE5cGjiHck1pYhZu5Zyk1a7aTeRMXsZk3x6dRkvj9
         r3Fh81WRBGDptWbk0dnZshLYWOg2yJbiGegFYedceRqj0OUria1mm/j55/olCEvpwij5
         cVCgaYp458nk4SSgNIn+Bnf8OcDqGwg7s2tTw14Ha6+DJwXZ+dQIdmGkxnG1VyG9AIxG
         Bqlw==
X-Gm-Message-State: AOAM530iHoAtpuw6epLrQ+PsLilvuASiipHFkFwYIKtBXW0YXX/0a6n7
        GxQHBe64ccPL2QVcc9C1uIE=
X-Google-Smtp-Source: ABdhPJyqxRDgDGi7C3XWIzkDAxc2r4tImvBS3FjFbxuBBAGHM4T+OaFAdnT9Y66fxkpod0pw9tPFog==
X-Received: by 2002:a50:c219:: with SMTP id n25mr72414424edf.306.1594293544416;
        Thu, 09 Jul 2020 04:19:04 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
        by smtp.gmail.com with ESMTPSA id lm22sm1594586ejb.109.2020.07.09.04.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 04:19:03 -0700 (PDT)
Subject: Re: chv-gpio interrupt storm on UMAX VisionBook 10Wi Pro
From:   Jiri Slaby <jirislaby@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
References: <5ed9d3ad-743f-e139-cf20-18eb418b24cd@kernel.org>
 <CACRpkdbWYhbtR+Tv5fFdxuyPAXU68uAswFYNZQfNFaR_89k=nw@mail.gmail.com>
 <9781e07e-a609-a2e1-112f-e5ebc78bfc23@redhat.com>
 <77bc7754-9a51-ed8f-5f88-3ed9f8ecca81@kernel.org>
 <2d5c5968-ad66-cbbc-a754-8f6114ff0ded@redhat.com>
 <ce01fc0d-e71a-26c9-1168-16926198fdef@kernel.org>
 <09661b70-0a19-e70a-1985-4da6024ec291@redhat.com>
 <29d9d787-bec2-7c41-30d4-d03c4cf75cdc@kernel.org>
 <12101845-4a03-802b-fcab-7fc78fed0be5@redhat.com>
 <071f2816-0cb6-b725-532b-08fc56c1ad1e@kernel.org>
 <ca4dfb41-843c-d859-2128-c985aec97a99@redhat.com>
 <032ecb14-e8be-19cd-9150-91c633f28a2c@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <bf44576d-8371-d30c-9704-ecebf913e7b5@kernel.org>
Date:   Thu, 9 Jul 2020 13:19:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <032ecb14-e8be-19cd-9150-91c633f28a2c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09. 07. 20, 13:10, Jiri Slaby wrote:
> Now, I need to find a way how to persuade dracut to automatically pick
> up the updated DSDT.

# cat > /etc/dracut.conf.d/dsdt.conf  <<EOF
acpi_table_dir=/boot/acpi/
acpi_override=yes
EOF
# cp dsdt.aml /boot/acpi/
# dracut --force

That is.

FWIW, now:
# cat /sys/bus/acpi/devices/ACPI0011:00/status
15
# cat /sys/bus/acpi/devices/INTCFD9:00/status
0

thanks,
-- 
js
