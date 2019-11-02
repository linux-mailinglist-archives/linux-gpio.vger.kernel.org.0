Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67AE7ED0A0
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Nov 2019 22:02:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726771AbfKBVCK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 2 Nov 2019 17:02:10 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51171 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbfKBVCK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 2 Nov 2019 17:02:10 -0400
Received: by mail-wm1-f67.google.com with SMTP id 11so12815531wmk.0
        for <linux-gpio@vger.kernel.org>; Sat, 02 Nov 2019 14:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WUB9JeVGuzH5Bq1mp3V2bq1E6UXztrv5bxAECoqFyMk=;
        b=uLY9BuOFrVwYNv+xrAeRHiSc1LGmgOwXrGwJopxhE1YN+qRLZkcx+exU8P/uhsDqbd
         lBcmQKm54wGMQS/iNTytODG4lhJztVy4uV4EUVo3yWdgzpozVxx8iJhUj9vBW4GZcSm7
         PSvXh89w3UGMMVgnMY50JuOqn2fIBIQRi/sq6jJwJh+PSIGol+Fg4/VZdKv/pbtAumf6
         8hyqhmUKt0EneWykkhbd9WOArxwT02pKCE/7xnKiPHswmIVebBl5Zddbxuv8TTfDNLcB
         Zwn4dUybvphPIK9PpmsqwBsc0IMXv/lTkfCMbvOGi3obJlzetJ2fNl1dLj8F+bDP+oX9
         wq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=WUB9JeVGuzH5Bq1mp3V2bq1E6UXztrv5bxAECoqFyMk=;
        b=nAT/8//B/+7adbxK/gxHyQditg2EhXq1231FyzPlTQzpFh4tWXRFxeWm9hwuaJXLj9
         CU2806fwqS5TMeot4wtvm5aMSrm9yrd+mgY5IMw3SirpkLUiyoQfhMlHRBGiJQjW4Lty
         PQp9+SIH2rbideu6V+DkLTlrwKHJcPGzps/OhpwXr8ucDTVr+conURMlYG2Yx/sdfrFK
         sYvAUVRfw0Zuzja2AmEG9jBIGKBhS+xr0Wpeade7aTdRyvGi0pnHBSYJuLtc0fdo95F5
         rvDWc+YoRSQvfCQdZO7oiCmAkGTMzHLqXY/DdQgzCqElA1HLK1JQ5sDw5eTTZGuBHkp1
         YX2A==
X-Gm-Message-State: APjAAAXExsVQIl4MQCphGT+BhWFUs38I4BlN/feKrpewWRwXtQpgKY79
        /4Bmc4Q6q7HVdhc0Oms/vJ0=
X-Google-Smtp-Source: APXvYqzmUNmwust/pI+t3gVmmCEMQmjZLvsrw2ZvvjOVmHu5HpYuhFLdg5+HKQXNREAC2DJlxyF0ZA==
X-Received: by 2002:a7b:cbc5:: with SMTP id n5mr16766175wmi.65.1572728528394;
        Sat, 02 Nov 2019 14:02:08 -0700 (PDT)
Received: from x1 ([2001:16b8:5c81:5b01:94f5:1750:1271:5d0e])
        by smtp.gmail.com with ESMTPSA id v81sm12254760wmg.4.2019.11.02.14.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2019 14:02:07 -0700 (PDT)
Date:   Sat, 2 Nov 2019 22:02:05 +0100
From:   Drew Fustini <drew@pdp7.com>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 0/2] gpio: add new SET_CONFIG ioctl() to gpio chardev
Message-ID: <20191102210205.GA26757@x1>
References: <20191031144825.32105-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191031144825.32105-1-warthog618@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 31, 2019 at 10:48:23PM +0800, Kent Gibson wrote:
> The patch series is against Bart's gpio/for-next branch[1] with v4 of 
> my bias patch series "gpio: expose line bias flags to userspace" applied.
> This is necessary to support setting of the bias flags introduced 
> there.

I'd like to apply this to test but I wanted to check should I still be applying
all the patches from "[PATCH v4 0/5] gpio: expose line bias flags to userspace"?

thanks,
drew 
