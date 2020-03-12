Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4A4D183350
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2020 15:39:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727467AbgCLOjZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Mar 2020 10:39:25 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35614 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727514AbgCLOjY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2020 10:39:24 -0400
Received: by mail-wr1-f68.google.com with SMTP id d5so7453266wrc.2;
        Thu, 12 Mar 2020 07:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Gh68Trk0v1VLiAj6jDTGi0HWdz0Xo0dSTWDaOMm1MTw=;
        b=LIvMy9yGVZS4Ff7qe030zT5MGioQil0x/ntqKRVbs/0DuarcdPb8iUCe6m36CDbCVG
         gfyMwbvb7pzqHndVHhVrvtV5VSxyBdspyYsnDUTpPprK23HjP9UDezOu08708IXtadRS
         jBiTuILhvPxhxdchFvTBDPkGF6Fj9aL6qP349QFgOLaNo1W/EIr5y7TQzu837KdbAbCC
         JqIDUA5NPHwqxC5Q3EYLcoJNig194jeNcZZqX7NIYr7rFes8fCjMyC8IfQRnVa9WEFDl
         kkL6Nhdvb6HdKbnMt0vgMEkw9k+s4d+7Y3kX50ef2g87/Dpum6/OkTqvmUnBp7O2ETwT
         dmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Gh68Trk0v1VLiAj6jDTGi0HWdz0Xo0dSTWDaOMm1MTw=;
        b=PNzZOu88/mKkVcki50ZNFv+870h5gdpGq6akQP1hj9B6gHUTuOz6vFACi2KQ3ftH4B
         A2zRxoZFKwVdyNj7QOcEaBSV8CBsJtAWPxQxF/RZlB68hRXQX2KFbKWmXQquVHV9Wz5Z
         SsCn9y0/J4K9bXkppstPKCxlIN4bDMYEvLONRAc9iCx4ZWZtDCl9orDV6AKp7jRkPEfS
         cyADSPYyECM+p4QZ9GXvrV/PsBNX0lcAxuOR27QjUiUFU+/fDAXaccAFM9FoOAsDbemd
         3fypbNckvBSzHt8tFfY+41x7Sahr2VQD+pdJw9FTyTx9v5yn6uDZhH7m9eemzwNmfIF2
         Qdcw==
X-Gm-Message-State: ANhLgQ2v4RZ7OXkpjzXgBptDvM2UgA21IwBvIcQaVjDLCvgjWQuzJ1MR
        rEnYIgVEHl2lxhUjxvlh8MEDTfh7+i4cvw==
X-Google-Smtp-Source: ADFU+vtd6pFHy8us6TRQj7Sj0ZChzcReBnODNWMt6SuYH+Snk6tVg1B51+V/2fjT4roFTLE5Xa2e0Q==
X-Received: by 2002:a5d:6a0e:: with SMTP id m14mr11537032wru.202.1584023962390;
        Thu, 12 Mar 2020 07:39:22 -0700 (PDT)
Received: from [10.7.1.8] ([37.58.58.229])
        by smtp.gmail.com with ESMTPSA id c8sm66848031wru.7.2020.03.12.07.39.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2020 07:39:21 -0700 (PDT)
Subject: Re: [PATCH] gpio-hammer: Avoid potential overflow in main
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20200312094008.1833929-1-gabravier@gmail.com>
 <CAMpxmJUUth5w8tvZp8mFV-FDz0YivmRWAqsOQSTdze1xagMX8A@mail.gmail.com>
 <38cbabe3-151b-1fd6-9d36-f27e9c9aa414@gmail.com>
 <CAMpxmJVSPA9CQBGULyk69KaP42oMdKGg883z0FeFC_mSA5w2xA@mail.gmail.com>
 <55db9307-9a20-239e-127c-ea043600248d@gmail.com>
 <CAMpxmJXUa7rk51XXvLjgueD9i1k98A+5gLx9WowChRb64k1mPQ@mail.gmail.com>
From:   Gabriel Ravier <gabravier@gmail.com>
Message-ID: <ba18951f-abf9-06eb-22a5-3f92d3c89fa2@gmail.com>
Date:   Thu, 12 Mar 2020 15:39:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAMpxmJXUa7rk51XXvLjgueD9i1k98A+5gLx9WowChRb64k1mPQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 3/12/20 3:36 PM, Bartosz Golaszewski wrote:
> czw., 12 mar 2020 o 15:33 Gabriel Ravier <gabravier@gmail.com> napisał(a):
>> Ah, seems like I didn't read the guide to getting code into the kernel
>> thoroughly enough. Should I send the patch yet again just with a v2 in
>> the subject header or is there no need to bother with that ?
>>
> Please do so that patchwork picks it up. Also: please don't top-post
> on LKML ie. respond below others' text.
>
> Bart

Ok, will send it with s/PATCH/PATCH v2 ASAP.

Btw, is the "top-posting" the reason why lkml.org doesn't seem to be 
able to find my replies to your posts ?

