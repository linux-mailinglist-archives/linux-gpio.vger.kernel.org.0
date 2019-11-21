Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCC04105D66
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2019 00:49:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbfKUXt5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Nov 2019 18:49:57 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:41503 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbfKUXt5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Nov 2019 18:49:57 -0500
Received: by mail-io1-f66.google.com with SMTP id z26so2232597iot.8
        for <linux-gpio@vger.kernel.org>; Thu, 21 Nov 2019 15:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lfp1CTtYDSnHvnmUeEVy9KACIY4Zt+EQINDWj/zWquY=;
        b=LBQtWLCpw46iV/frld7CfwAMenS2oQkdpLLZDzFHqBqjUdoJRSXC2DYQjt1I7YvAA5
         1ur3B/HThsu1oAvq3dv0xnmIuPW/+8Nnk5zjfbGQWPnYf8OKwIbkVv78ouWqgLd8K5QD
         saNtPA8V+lZYlP5WeSLwuDoU5vvrNZlCiWBHFziQB5Vj0ZDZyFP7ujKIt8QADq+FCMnh
         7La5/KipV8aXcTxt7/YL1jxa95T/MuwVL5Azf/BCdoCopmOcIUTLZuuueo5w1aABmtVZ
         NXZ/8wKzf3Ji/3cgu5Jk2qWjo/9D4p0FDlHtumDlhRYTu/l9tN+p5b0aeAiHw9/Jl02m
         QvwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lfp1CTtYDSnHvnmUeEVy9KACIY4Zt+EQINDWj/zWquY=;
        b=QYJp9hTYw7Ax+VQv5cn7CQNhaGKeFHcAQKUImWnzKap56vrXsU6jrhw/iza4vAXcEO
         /YyjvsS8u6Hfl68HM0RoE2tJJ9luyuuEmX3gZo5JcwGxIeTdA6NwPlUgP+x5+HsMjRUL
         eAM60lcMVuro5fI8KePnjAIbQEAhJuR93R0MT3Zq3xIITsidOf7Ab5HOmZ84RUhyccbW
         Hp2KciUCie3yl1HF5HhQ9ACERBKPH0lJnn9T3DuYVq4QEjeITmb0nJVSk06wBu4R3mAI
         4AF5QKCJQyVsfvxw1l28ZE7DLHwk46AOlxjl0zjoeimYAKvwpdAWgjEXwv8b951Fe3ZX
         xNTw==
X-Gm-Message-State: APjAAAWxXp358MmHQ5TLw7pO+QNklfjAkN9zDPc6fNKzWftd7wyBQp84
        yeob0mlTeOTBZm9IHqvDWP4=
X-Google-Smtp-Source: APXvYqxCAhULoUW+NUo+5bO+RcWrrofF44+lFEMpOtdvP6JhrPzDZXBqtp3Tnra6qfW/Trc6PDAdGw==
X-Received: by 2002:a5d:958d:: with SMTP id a13mr9954426ioo.144.1574380195576;
        Thu, 21 Nov 2019 15:49:55 -0800 (PST)
Received: from sol (220-235-109-115.dyn.iinet.net.au. [220.235.109.115])
        by smtp.gmail.com with ESMTPSA id i102sm611903pje.17.2019.11.21.15.49.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Nov 2019 15:49:54 -0800 (PST)
Date:   Fri, 22 Nov 2019 07:49:49 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [libgpiod][PATCH] core: deprecate gpiod_needs_update()
Message-ID: <20191121234949.GA6806@sol>
References: <20191121173115.11016-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191121173115.11016-1-brgl@bgdev.pl>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 21, 2019 at 06:31:15PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> This function and the logic behind have been introduced in an early
> version of libgpiod for reasons that have been long forgotten.
> 
> When updating the line info after a line request fails, just propagate
> the error out of the request function instead of setting the internal
> needs_update variable. Drop the entire logic behind gpiod_needs_update(),
> make this routine always return false and mark it as deprecated in the
> header.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Suggested-by: Kent Gibson <warthog618@gmail.com>
> ---
> 
> Kent,
> 
> please take a look at this patch. I thought about it and didn't find any
> good reason to keep this function in the API, so I propose to deprecate it
> and propagate any errors from gpiod_line_update() when it's called internally
> as you suggested.
> 

The patch makes total sense to me - though I will now have to update
my set_config and set_flags to match.  You can assume that change will
be in v3 of my patch series - assuming you apply this patch.


>  include/gpiod.h    | 31 +++++++++++--------------------
>  lib/core.c         | 30 ++++++++++++++----------------
>  tests/tests-line.c |  2 --
>  3 files changed, 25 insertions(+), 38 deletions(-)
> 
> diff --git a/include/gpiod.h b/include/gpiod.h
> index 6dfa18a..588198f 100644
> --- a/include/gpiod.h
> +++ b/include/gpiod.h
> @@ -729,33 +729,24 @@ bool gpiod_line_is_open_source(struct gpiod_line *line) GPIOD_API;
>   *         returns -1 and sets the last error number.
>   *
>   * The line info is initially retrieved from the kernel by
> - * gpiod_chip_get_line(). Users can use this line to manually re-read the line
> - * info.
> + * gpiod_chip_get_line() and after every successful request. Users can use
> + * this line to manually re-read the line info.
> + *
> + * We currently have no mechanism provided by the kernel for that and for the
> + * sake of speed and simplicity of this low-level library we don't want to
> + * re-read the line info automatically everytime a property is retrieved. Any
> + * daemon using this library must track the state of lines on its own and call
> + * ::gpiod_line_update if needed.
>   */
>  int gpiod_line_update(struct gpiod_line *line) GPIOD_API;
>  

The second paragraph, when combined with the first paragraph, can imply that we
have no mechanism to re-read line info, which is definitely not what you mean.
Perhaps change "kernel for that" to "kernel to keep the line info synchronized".

Perhaps also highlight that requested lines do keep themselves synced - any
functions that operate on those will update the info as well, so you
shouldn't need to use this function on requested lines.  I think you have
tried to cover that with the "and after every successful request" addition, but
the word "request" is overloaded in this context, making it a bit confusing.
I'd move that addition into a third paragraph that deals with requested lines.

Other than that, the patch looks good to me.

Cheers,
Kent.

>  /**
>   * @brief Check if the line info needs to be updated.
>   * @param line GPIO line object.
> - * @return Returns false if the line is up-to-date. True otherwise.
> - *
> - * The line is updated by calling gpiod_line_update() from within
> - * gpiod_chip_get_line() and on every line request/release. However: an error
> - * returned from gpiod_line_update() only breaks the execution of the former.
> - * The request/release routines only set the internal needs_update flag to true
> - * and continue their execution. This routine allows to check if a line info
> - * update failed at some point and we should call gpiod_line_update()
> - * explicitly.
> - *
> - * This routine will not indicate any potential changes introduced by external
> - * actors (such as a different process requesting the line). We currently have
> - * no mechanism provided by the kernel for that and for the sake of speed and
> - * simplicity of this low-level library we don't want to re-read the line info
> - * automatically everytime a property is retrieved. Any daemon using this
> - * library must track the state of lines on its own and call
> - * ::gpiod_line_update if needed.
> + * @return Deprecated and no longer functional - always returns false.
>   */
> -bool gpiod_line_needs_update(struct gpiod_line *line) GPIOD_API;
> +bool
> +gpiod_line_needs_update(struct gpiod_line *line) GPIOD_API GPIOD_DEPRECATED;
>  
>  /**
>   * @}
> diff --git a/lib/core.c b/lib/core.c
> index d79e52e..a21918c 100644
> --- a/lib/core.c
> +++ b/lib/core.c
> @@ -41,7 +41,6 @@ struct gpiod_line {
>  	bool open_drain;
>  
>  	int state;
> -	bool needs_update;
>  
>  	struct gpiod_chip *chip;
>  	struct line_fd_handle *fd_handle;
> @@ -320,15 +319,6 @@ static int line_get_fd(struct gpiod_line *line)
>  	return line->fd_handle->fd;
>  }
>  
> -static void line_maybe_update(struct gpiod_line *line)
> -{
> -	int rv;
> -
> -	rv = gpiod_line_update(line);
> -	if (rv < 0)
> -		line->needs_update = true;
> -}
> -
>  struct gpiod_chip *gpiod_line_get_chip(struct gpiod_line *line)
>  {
>  	return line->chip;
> @@ -374,9 +364,9 @@ bool gpiod_line_is_open_source(struct gpiod_line *line)
>  	return line->open_source;
>  }
>  
> -bool gpiod_line_needs_update(struct gpiod_line *line)
> +bool gpiod_line_needs_update(struct gpiod_line *line GPIOD_UNUSED)
>  {
> -	return line->needs_update;
> +	return false;
>  }
>  
>  int gpiod_line_update(struct gpiod_line *line)
> @@ -405,8 +395,6 @@ int gpiod_line_update(struct gpiod_line *line)
>  	strncpy(line->name, info.name, sizeof(line->name));
>  	strncpy(line->consumer, info.consumer, sizeof(line->consumer));
>  
> -	line->needs_update = false;
> -
>  	return 0;
>  }
>  
> @@ -537,7 +525,12 @@ static int line_request_values(struct gpiod_line_bulk *bulk,
>  	gpiod_line_bulk_foreach_line(bulk, line, lineptr) {
>  		line->state = LINE_REQUESTED_VALUES;
>  		line_set_fd(line, line_fd);
> -		line_maybe_update(line);
> +
> +		rv = gpiod_line_update(line);
> +		if (rv) {
> +			gpiod_line_release_bulk(bulk);
> +			return rv;
> +		}
>  	}
>  
>  	return 0;
> @@ -577,7 +570,12 @@ static int line_request_event_single(struct gpiod_line *line,
>  
>  	line->state = LINE_REQUESTED_EVENTS;
>  	line_set_fd(line, line_fd);
> -	line_maybe_update(line);
> +
> +	rv = gpiod_line_update(line);
> +	if (rv) {
> +		gpiod_line_release(line);
> +		return rv;
> +	}
>  
>  	return 0;
>  }
> diff --git a/tests/tests-line.c b/tests/tests-line.c
> index 8411132..205c622 100644
> --- a/tests/tests-line.c
> +++ b/tests/tests-line.c
> @@ -78,7 +78,6 @@ GPIOD_TEST_CASE(consumer, 0, { 8 })
>  
>  	ret = gpiod_line_request_input(line, GPIOD_TEST_CONSUMER);
>  	g_assert_cmpint(ret, ==, 0);
> -	g_assert_false(gpiod_line_needs_update(line));
>  	g_assert_cmpstr(gpiod_line_consumer(line), ==, GPIOD_TEST_CONSUMER);
>  }
>  
> @@ -101,7 +100,6 @@ GPIOD_TEST_CASE(consumer_long_string, 0, { 8 })
>  	ret = gpiod_line_request_input(line,
>  			"consumer string over 32 characters long");
>  	g_assert_cmpint(ret, ==, 0);
> -	g_assert_false(gpiod_line_needs_update(line));
>  	g_assert_cmpstr(gpiod_line_consumer(line), ==,
>  			"consumer string over 32 charact");
>  	g_assert_cmpuint(strlen(gpiod_line_consumer(line)), ==, 31);
> -- 
> 2.23.0
> 
