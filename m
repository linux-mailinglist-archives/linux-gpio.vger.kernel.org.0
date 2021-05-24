Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CBC738F4E5
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 23:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233924AbhEXVbP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 17:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbhEXVbN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 17:31:13 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDD27C061574
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 14:29:44 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id v12so15276876plo.10
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 14:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZAfJyN6KbcmsfNgmfey8+U+vZvNxVBX2GV4RwXp8VdM=;
        b=hrmkMvyy7LVSTvrpLJKDsJovZAiHuVZIfBXIg28tHPEI33NnzLmta39baZ7dbPgbad
         ZTlqZJKlm/HWjJBL/bUm/c/9nxywJBfkMrFObkGWZ41LXBL6zyNhwnGcQT6VY4h6tB5Z
         odgZ3WyBEg/WpNlURjNjw6VuPmz7XdkpOPD0FujJZs19o6VuL0kQArG3lKCsLXkuXhy6
         JtwQeTU8MirWYx7q5VeAR7r/lw/RRaOJ/3+Oy3OO8uUmrGKJ0EHGt1pLtX6H64kATPTM
         0+YUCcUw3vFk8+bMlJu792QwryYDcbphvj4zPRon+4h4M6if68ZKCYNEZsGbX2eVRud6
         S0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZAfJyN6KbcmsfNgmfey8+U+vZvNxVBX2GV4RwXp8VdM=;
        b=D5dog3MGOWcsv0nrX833GvV+wnS/hYq6vDyv9hl8Cy4VQE7voNIqFMEG1R373X7yD3
         BSoJDWT+ifb7ZoFR9hLy378+L/QZK0MovkZWEg63gF9NHHBnN2WFQNCULIzFluazgI/S
         8rUk4DN72dtc31VK5YAyC9D3Ad3+bl00GLgoiPYQOOe/9B3Ii6JOJ+4b5G7s0R3Vb5z5
         Eq+56k34S+7aJKdql1ZFkTTXY/vSrsC+NrezC/ROq5/+NswtgUaD7p+KRYnVTaP4UaKs
         +XS6fKw3y9sFuDou4qe7dmqVW01YqgvFudMZKgAid4EvahsiYeR08XHu4dZDaKTZqMWT
         1BRw==
X-Gm-Message-State: AOAM5328Y8hx1nRrHUWUFf/s4l7rVpPpPGTBgX8P3VoC9AVGuK7AaBfB
        OOb/HgF0if77KgJ7wGSgsVwYxA==
X-Google-Smtp-Source: ABdhPJyIYxJo6nyO3znGfkNdGR/rYj69B2iUpcctPf8HghlDz1mKOn9EwJ+lfkntw5gf1BYVRyLnlw==
X-Received: by 2002:a17:902:d503:b029:f2:c88c:6349 with SMTP id b3-20020a170902d503b02900f2c88c6349mr27652879plg.84.1621891784328;
        Mon, 24 May 2021 14:29:44 -0700 (PDT)
Received: from x1 ([2601:1c0:4701:ae70:5a64:3ac5:f809:b62e])
        by smtp.gmail.com with ESMTPSA id p18sm6312662pff.112.2021.05.24.14.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 14:29:43 -0700 (PDT)
Date:   Mon, 24 May 2021 14:29:41 -0700
From:   Drew Fustini <drew@beagleboard.org>
To:     Mauri Sandberg <sandberg@mailfence.com>
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com
Subject: Re: RESEND PATCH v3
Message-ID: <20210524212941.GB3756746@x1>
References: <20210325122832.119147-1-sandberg@mailfence.com>
 <20210524162906.30784-1-sandberg@mailfence.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524162906.30784-1-sandberg@mailfence.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 24, 2021 at 07:29:04PM +0300, Mauri Sandberg wrote:
> For some reason Bart did not get the patches with the previous email. So
> resending.
> 
> -- Mauri
> 
> 

Tested-by: Drew Fustini <drew@beagleboard.org>
Reviewed-by: Drew Fustini <drew@beagleboard.org>

I just replied to the original v3 cover letter with my test results [1].

-Drew

[1] https://lore.kernel.org/linux-gpio/20210524212538.GA3756746@x1/
