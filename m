Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5FB176477
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2020 20:58:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbgCBT6C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Mar 2020 14:58:02 -0500
Received: from mail-yw1-f65.google.com ([209.85.161.65]:35134 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgCBT5i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Mar 2020 14:57:38 -0500
Received: by mail-yw1-f65.google.com with SMTP id a132so1051007ywb.2;
        Mon, 02 Mar 2020 11:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GKP1xnf+jUUC+vOfFhdMTbNrJBQ854KSrSLYHrZ06Bk=;
        b=Awop9XOq1i7oNr44YoGmA/aw95RSF8KIPQDXWo+1HSAkfVPLyZ/RyncObWJcPd4laq
         NzxXrvF8SPPpMcfZV8Luei62eAqaZpvxHJQk18hal4Omfa3ZTpgPybX2vqKC7X5hsQV/
         sL71FkPxxFdS1utqODguNaCYJjniAdx39fLE73d0ZVIHjqbXQ96iIO+whXm/XoWqoHOC
         wkX09IwZ7qhUr0xP4hdn/Oxz87kY9U45HEcdRQCutvEzzdnPeiVieD1uaMiCwXSkRBPh
         6aWgVRynhzIfrnW6fjyB+eHMv8yyCQ/wniKw7sNUSMagdPkHHZXnTkAs/rUavxHIt9VF
         layQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GKP1xnf+jUUC+vOfFhdMTbNrJBQ854KSrSLYHrZ06Bk=;
        b=MoR9ZDhWQVolFXAU9UNvzVF/E8XLDUvffN79Uk7twDwhYGPFMFxU5t1S4FK73WCQQJ
         tPEM3Q897cWR1SKSUNvXiRIGzBE4dNRpSrGF6VUI9nwVXwfGt+GoQKh5/X6WsX0jbdBn
         GTSxqmz0qx5ysa05UxTUxJQ7OKXxnaU8N0wUpyokVgz8ur73IJ36KGh6a/pkkOwG+raP
         bq6Vn5h6P4Jw59Joxx4Zb7ToUde1WUrarldX+37BL3S0eXPr/HWi3cZ5UgO1Aac0VAO5
         8gu2N4a1/dz8re/WFB0SPKMhOPMAt6HZcPBeemKyhV29lVhhYC8zDUWckEAARr+dohEj
         mYeg==
X-Gm-Message-State: ANhLgQ16xMz92iT4pc6OANiqFwCfmeIYSDFmvx3W5+ZCC5LpvGDAIkH5
        psvsZaNjCP9JySTCFN9vor0=
X-Google-Smtp-Source: ADFU+vvSk0t778qUzgJHbIXKFXgek6hyiUQEZELhI0jIaTTa8lYIW9yq45tXspn4bqz2gB7DHU9ozg==
X-Received: by 2002:a0d:fc82:: with SMTP id m124mr1013400ywf.174.1583179055311;
        Mon, 02 Mar 2020 11:57:35 -0800 (PST)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net. [73.88.245.53])
        by smtp.gmail.com with ESMTPSA id h203sm8224852ywb.98.2020.03.02.11.57.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Mar 2020 11:57:35 -0800 (PST)
Subject: Re: [PATCH v2 1/2] gpio: of: Extract of_gpiochip_add_hog()
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200220130149.26283-1-geert+renesas@glider.be>
 <20200220130149.26283-2-geert+renesas@glider.be>
 <CACRpkdbgsR1n1qj3HmQWcEjeDdN85N1Mw8kLOUAeDjESW36MDg@mail.gmail.com>
 <d2b87102-fdf3-f22f-8477-5b2105d9583b@gmail.com>
 <CACRpkdZwaKA-Gq4wjkPZ_VFiOgNgvLPnYmx4A3AFE-0eNNjQpQ@mail.gmail.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <ecde265b-f451-7514-2265-cf4d3024690b@gmail.com>
Date:   Mon, 2 Mar 2020 13:57:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdZwaKA-Gq4wjkPZ_VFiOgNgvLPnYmx4A3AFE-0eNNjQpQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 2/28/20 4:43 PM, Linus Walleij wrote:
> On Fri, Feb 21, 2020 at 6:18 PM Frank Rowand <frowand.list@gmail.com> wrote:
>> On 2/21/20 10:08 AM, Linus Walleij wrote:
> 
>>> Patch applied with Frank's Review tag.
>>
>> I created a devicetree unittest to show the problem that Geert's patches
>> fix.
>>
>> I would prefer to have my unittest patch series applied somewhere,
>> immediately followed by Geert's patch series.  This way, after
>> applying my series, a test fail is reported, then after Geert's
>> series is applied, the test fail becomes a test pass.
>>
>> Can you coordinate with Rob to accept both series either via
>> your tree or Rob's tree?
> 
> I see Rob already applied the test.
> 
> I do not personally bother much about which order problems
> get solved but I guess if Rob can back out the patch I can apply
> it to my tree instead, before these patches. for some time,
> before I start pulling stuff on top.
> 
> Yours,
> Linus Walleij
> 

At this point, if it is a lot of trouble or confusion, I would not
bother undoing the commits that have been done.  I'll leave it up
to you and Rob to coordinate if you do decide to undo.

-Frank
