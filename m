Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E443779CAC7
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 10:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233046AbjILI7Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Sep 2023 04:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233056AbjILI7W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2023 04:59:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D611DE7A
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 01:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694509111;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Et4XrSW8efLvThc1V89jDZFB/myxZezLXAdDv36HbvY=;
        b=fo3LAh1d44EXYka6vn5K0Q+bk8ERtqc6HkBlfoj8hblacXxmedWzfRfhCMGwAmKDyz1Tv8
        A3/EpXVqxTYPBLJgY/xalQUjQ9lepUdbGhNWGr0q4G2zoIk8JWEuJ1FwndIbayDd1UrOZ+
        XymYHOGGvYvuJqHGLIQCq67loXc6zxc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-irHOFuYYM6mTZWzj2q6oJQ-1; Tue, 12 Sep 2023 04:58:29 -0400
X-MC-Unique: irHOFuYYM6mTZWzj2q6oJQ-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-52a0f5f74d7so3690786a12.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 01:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694509108; x=1695113908;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Et4XrSW8efLvThc1V89jDZFB/myxZezLXAdDv36HbvY=;
        b=l++lcaLeVL75J2rNBZ3yum3LV1ubOupcUuF0MnVefF18aV4NzDwJ/ARRZqxinOMo9K
         uCqbqxKhQ18cbPjGpwNJULKD024sFjHZ3MwvJ8d/0kg2oyMkkomGd5Wdbs7L/5lbQ+9I
         l+KowsvoSgzdN2AcdmtS1epTTidRY95lFE1Xdbz1uEG1ybg8J6lNtPuIAdfv//cUQFsk
         TjJw1kEq0NY7bH7JRaFI0dIQWdcOsA5p7ExMnTy7Zhd39/1lS/g2FgmpTnS0jzXbvMpC
         7bd0u9+uG97NGrAHhwfrPpMstYNRYZel9BYpsknuImg1UXi3Wl/s3NSW2zVKml+M4en7
         azqQ==
X-Gm-Message-State: AOJu0Yy/BhJ8BGdZORnt+LTdflB49zun+LOMdFHB1brsA7Jj+VKeXLpo
        xrUNBPOIgDD6L/zEeErBQW/O2CoTfeSmWZnPVQ+4wlQF+b6sYJ1AtuWUSAMYv8JyrJNzzCLGJC9
        ZXTrIeFtu74B8ubkbyNRASw==
X-Received: by 2002:a17:907:2c59:b0:9a1:af6f:e375 with SMTP id hf25-20020a1709072c5900b009a1af6fe375mr9077130ejc.35.1694509108240;
        Tue, 12 Sep 2023 01:58:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFGcKLf77LasWyQfqqzucp8Wj0iTzjDeVCvR4PK9N9Sl0R5dh6jR9ZhKvk/teVxGmkfyYmNg==
X-Received: by 2002:a17:907:2c59:b0:9a1:af6f:e375 with SMTP id hf25-20020a1709072c5900b009a1af6fe375mr9077114ejc.35.1694509107930;
        Tue, 12 Sep 2023 01:58:27 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gs9-20020a170906f18900b0099bd5d28dc4sm6585633ejb.195.2023.09.12.01.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 01:58:27 -0700 (PDT)
Message-ID: <4246946d-40e3-7df7-3fc4-9aa10e1dee10@redhat.com>
Date:   Tue, 12 Sep 2023 10:58:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] pinctrl: amd: Add a quirk for Lenovo Ideapad 5
Content-Language: en-US, nl
To:     Linus Walleij <linus.walleij@linaro.org>,
        Mario Limonciello <mario.limonciello@amd.com>
Cc:     Shyam-sundar.S-k@amd.com, Basavaraj.Natikar@amd.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        regressions@lists.linux.dev, lucapgl2001@gmail.com
References: <20230829165627.156542-1-mario.limonciello@amd.com>
 <20230829165627.156542-4-mario.limonciello@amd.com>
 <1d891d34-053a-368d-cf47-bcaf35284c79@redhat.com>
 <07353676-bad0-44f8-a15a-4877f1898b6b@amd.com>
 <811225f8-c505-7344-ac18-882472ee0348@redhat.com>
 <d232c11d-901f-4ebc-b408-bed042ed8da9@amd.com>
 <6734c409-89f1-89a1-3096-4054be29faf1@redhat.com>
 <f0ceff1c-ba5f-4c6b-ac0e-c4195f477500@amd.com>
 <CACRpkdYGxreyD8NVuKs2G44htR8EixdvGr3+ma=HrxHUP3NDQg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CACRpkdYGxreyD8NVuKs2G44htR8EixdvGr3+ma=HrxHUP3NDQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

On 9/12/23 09:08, Linus Walleij wrote:
> On Thu, Aug 31, 2023 at 7:53 PM Mario Limonciello
> <mario.limonciello@amd.com> wrote:
> 
>> Linus - please disregard version 1.
> 
> OK!
> 
>> I provided Luca a new series that implements this approach that Hans and
>> I discussed and they confirmed it works.
>>
>> I have some minor modifications to it to narrow where it's applied so we
>> don't have needless notifications and will send it for review after the
>> new modifications are tested as well.
> 
> OK standing by, I'll wait for Hans' ACK and then merge it for fixes.

AFAICT Mario has not posted a new version (yet),
so there is nothing for me to ack (yet).

Regards,

Hans


