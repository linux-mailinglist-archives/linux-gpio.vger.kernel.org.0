Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE3A62996AE
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 20:19:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1783898AbgJZTS6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 15:18:58 -0400
Received: from mail-ej1-f53.google.com ([209.85.218.53]:33117 "EHLO
        mail-ej1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1773370AbgJZTS6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 15:18:58 -0400
Received: by mail-ej1-f53.google.com with SMTP id c15so15352495ejs.0;
        Mon, 26 Oct 2020 12:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e/zjg8ZmBUsHqEVh2yz1OOXy/VPIwaF2s+uF9JF6pPQ=;
        b=Yp7WVMcSNy7gw6sDgq8B7+/ETE1s+G8cduTcX21Elzuzz+D/N+8N8tfY0vlKL2il8a
         m6ven6b42PpD8aMkItnx0ychs8NyVNPYUk+4zE9pNyNWo8ZQCu/pHWlYrbHXvIFaNRTt
         U9ZYuxR7q/CPOk2/w+7bn2bel5kZiqFA/r+CEJBENCwGVVfBtJBOKh6T9C57Ge51qIDG
         49vnCjAuqjgjueZAPEWCh3II96/NPYD4c0mI9UnHABA4+4J/qeHgiCU/HK8OCz5z9GSf
         fnFOpjgua+qRnKSQkjLm/kqqElMh5RG2Q7HL+PEwWpiG6j+bDNRKaYkihwlv89SN1hnu
         30NA==
X-Gm-Message-State: AOAM530QhrApR8DTWiAz/YCUMlSWFjbuzQ9HIlmruX2LSlaaChLsnbBx
        Izmgg80iOaqBOhtLdbMsuZ8=
X-Google-Smtp-Source: ABdhPJzPa4SJJavsI0VuwDRkYfhiqqtixWebwe2ZjlzfJwq79WmOJ1XGCV8KuJsr1laoNQDNnjnETQ==
X-Received: by 2002:a17:906:22d8:: with SMTP id q24mr16640974eja.479.1603739933054;
        Mon, 26 Oct 2020 12:18:53 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id q2sm6369356ejd.20.2020.10.26.12.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 12:18:51 -0700 (PDT)
Date:   Mon, 26 Oct 2020 20:18:49 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     trix@redhat.com
Cc:     kgene@kernel.org, tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: samsung: pinctrl-s3c24xx: remove unneeded
 break
Message-ID: <20201026191849.GA173150@kozik-lap>
References: <20201020131520.29117-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201020131520.29117-1-trix@redhat.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 20, 2020 at 06:15:20AM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> A break is not needed if it is preceded by a return.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
> 
> v2: Improve commit log

Thanks, applied.

Best regards,
Krzysztof

