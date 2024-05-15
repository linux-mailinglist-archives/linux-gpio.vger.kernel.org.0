Return-Path: <linux-gpio+bounces-6381-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DF58C638B
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2024 11:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5A7A1F21E8A
	for <lists+linux-gpio@lfdr.de>; Wed, 15 May 2024 09:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3B4F58AA5;
	Wed, 15 May 2024 09:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+LGvqkw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003FC56458
	for <linux-gpio@vger.kernel.org>; Wed, 15 May 2024 09:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715764735; cv=none; b=sM8Azu7Mqz7xk85D7UNtU4k3nJNnQbpCyicpM9V1iYtwDN/ckVPodHQmrBiyAsOQTrBPEayimHHw/GSYnBUvnQ0eW1oJqBg9fL5nf0mhwNMrU0eswsV49V9ehc7TAy42dSiDdKnCxoZJwcVHkm/+U1T+PczrSECbbMYjKWk9CWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715764735; c=relaxed/simple;
	bh=do/bVDGnQAdCbuiehDceIVTEqNgrlILzW2TpnrJA46c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X5dRneEUc10bzZDbpAY7MDHNEmkmuV80aA1btdGREp08rqtJ7tP+zcieQ6a45UQdp+tE19JIvYA3RuwbSeWDQBdzdhYWq5kz3lrkFQRxW3iIyFwVI0PI/oxWgsBJVehQ8HHR6INV3eazTTQWBeQ91d9y9MorB4VbwNDcWXcGSZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+LGvqkw; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6f5053dc057so3034644b3a.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 May 2024 02:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715764733; x=1716369533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LfCtQEsVzX6rCo5Wm+N+laaNW3VqknRJQu6iNM2z1do=;
        b=Z+LGvqkw+trbMV/ynB7epfyaAEHcmc5570PFKJu+TyP+CNtFgaK3H+9N8rd3iU+rkj
         sdmnVljyHbgIZ40C5UJCALSyFYYFnyOK5qlkWy9n5AuyA+nBBBhRyyd5KemXjAHU75WF
         70zsSo/Tl01miZok9dzhRsVfcgoQh/RVutqi2Wen51XaessD9/eK0CnKUmU8HsepOsT4
         ur9XMpDM1Vh2Nk+wNr9yT2NtI8S2pOPqarpL7eqP7ge1ZsniuL6m//RynCMNi5FY52EV
         lZxApUVt6a3aCHfqlovjkY75exJBGYr0EvdQHDPMCbfZIZJpWPFASLhGS0V+UWbLI5QS
         loEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715764733; x=1716369533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfCtQEsVzX6rCo5Wm+N+laaNW3VqknRJQu6iNM2z1do=;
        b=mKm6HDEVTztyJXLvwLCEJ4M14PDMpY90cSXlL0AqRU7t3nqr4hh+gMYJEhrMwFkjTL
         aletoXUvQoijiPPENa4+t+wtPCzF4dd0zlnk14FS8cRzex0/+XqIXU79BtNQOmH/OBRR
         lduYuB0PWc/PEtOYJEfBPT85okWgrmtjrjZGx29YromWmCwtdqO+S91TUhRUaxJUU2kh
         nv8W1DhZ2oxQeC4hcP5Wt0hHCte/x8eNLoSsorkX5AUIoS9puPoqO7o3Iu+9NOIdTy5M
         aY/ymTvcXOlMrViq0tKo4FOkT9N/PqT/xq8GJ4rjRDZzfWAoky95TKBJRy2+G0z8PArx
         2jMg==
X-Gm-Message-State: AOJu0Yyf4nL4CmscgSU4Evobgjy3KA6kF1AXtjdVj7Nst8rP/FRF3I9n
	ZAwrr3XJ+eOEYSAsUaiTMK9T2/xG1C+7Zw0oXK9C9f/pz7yRiBZer7IWzQ==
X-Google-Smtp-Source: AGHT+IGssAwWkFMTArR+l/Iefd1xta0JHyF4zm6jBPUNjKRTDFZJPz3KR1SE7Aus3rfcZzO5pQRf5Q==
X-Received: by 2002:a05:6a20:7fa6:b0:1af:baf9:fef6 with SMTP id adf61e73a8af0-1afde0cd696mr19767130637.16.1715764733189;
        Wed, 15 May 2024 02:18:53 -0700 (PDT)
Received: from rigel (60-241-107-82.static.tpgi.com.au. [60.241.107.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f660a22274sm4144553b3a.14.2024.05.15.02.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 02:18:52 -0700 (PDT)
Date: Wed, 15 May 2024 17:18:48 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][RFC] helper functions for basic use cases
Message-ID: <20240515091848.GA86661@rigel>
References: <20240507022106.GC26136@rigel>
 <CAMRc=Men25EQSuUtyf+b-TSfndnmQ8oCfNVU82pq1E-+r64QHg@mail.gmail.com>
 <20240511011144.GA3390@rigel>
 <CAMRc=McwX7f4KNqunRSj6jk=6-6oj9kUy9XJRc=HokyfaiUsmA@mail.gmail.com>
 <20240513101331.GB89686@rigel>
 <CAMRc=MftXh6SV_jNVDaUOwww21gH5gFeb8zGSVBLv=jMP_mFKQ@mail.gmail.com>
 <20240514133804.GA107324@rigel>
 <CAMRc=MdyUmfGaJ_0edvhMYwC7x5HwYyFAdD5EY-13+5yoRUeiw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdyUmfGaJ_0edvhMYwC7x5HwYyFAdD5EY-13+5yoRUeiw@mail.gmail.com>

On Wed, May 15, 2024 at 01:26:32AM -0700, Bartosz Golaszewski wrote:
> On Tue, 14 May 2024 15:38:04 +0200, Kent Gibson <warthog618@gmail.com> said:
> > On Tue, May 14, 2024 at 06:31:39AM -0700, Bartosz Golaszewski wrote:
> >> On Mon, 13 May 2024 12:13:31 +0200, Kent Gibson <warthog618@gmail.com> said:
> >> >
> >> >> > /**
> >> >> >  * @brief Set the bias of requested input line.
> >> >> >  * @param olr The request to reconfigure.
> >> >> >  * @param bias The new bias to apply to requested input line.
> >> >> >  * @return 0 on success, -1 on failure.
> >> >> >  */
> >> >> > int gpiod_olr_set_bias(struct gpiod_line_request * olr,
> >> >> > 		       enum gpiod_line_bias bias);
> >> >>
> >> >> For this to work, you'd most likely need a new struct wrapping the request
> >> >> and also storing the line config. Otherwise - how'd you keep the state of all
> >> >> the other line settings?
> >> >>
> >> >
> >> > Yeah, I realised that when I went to implement it :(.
> >> >
> >> > What I implemented was to read the line info and build the config from that.
> >> > So no impact on core.
> >> > Not the most efficient, but for this use case I wan't fussed.
> >> >
> >>
> >> I think those simplified requests should wrap the config structures, otherwise
> >> we'd have to readback the config from the kernel which would become quite
> >> complex for anything including more than one line.
> >>
> >
> > The whole point of the simplified requests is that they only deal with
> > a single line.  And the config mutators only deal with a single input.
> >
>
> For now anyway. :)
>
> > Wouldn't wrapping break the ability to use all the other
> > gpiod_line_request_XXX functions, and so require adding more functions
> > to make use of the simplified requests?
> >
>
> Not sure why? You need a request for a single line anyway and you need to store
> the config for it somewhere as toggling a single property will require a full
> gpiod_line_request_reconfigure() anyway.

But I don't intend to store the config for it, so the existing
gpiod_line_request is fine.

>
> I don't think it'll be enough to re-use struct gpiod_line_request here, you
> need some new structure. Unless you know how to do it. In that case: show me
> the code. :)
>

Sure thing.  This is what I have at the moment (the declarations are as
per earlier, just renamed.  And I just noticed some variables I haven't
renamed.  I'll add it to the todo list.):

diff --git a/lib/line-request.c b/lib/line-request.c
index b76b3d7..5af23e0 100644
--- a/lib/line-request.c
+++ b/lib/line-request.c
@@ -305,3 +305,200 @@ gpiod_line_request_read_edge_events(struct gpiod_line_request *request,

 	return gpiod_edge_event_buffer_read_fd(request->fd, buffer, max_events);
 }
+
+static struct gpiod_line_request *
+ext_request(const char  *path, unsigned int offset,
+	    enum gpiod_line_direction direction,
+	    enum gpiod_line_value value)
+{
+	struct gpiod_line_request *request = NULL;
+	struct gpiod_line_settings *settings;
+	struct gpiod_line_config *line_cfg;
+	struct gpiod_chip *chip;
+	int ret;
+
+	chip = gpiod_chip_open(path);
+	if (!chip)
+		return NULL;
+
+	settings = gpiod_line_settings_new();
+	if (!settings)
+		goto close_chip;
+
+	gpiod_line_settings_set_direction(settings, direction);
+	if (direction == GPIOD_LINE_DIRECTION_OUTPUT)
+		gpiod_line_settings_set_output_value(settings, value);
+
+	line_cfg = gpiod_line_config_new();
+	if (!line_cfg)
+		goto free_settings;
+
+	ret = gpiod_line_config_add_line_settings(line_cfg, &offset, 1,
+						  settings);
+	if (ret)
+		goto free_line_cfg;
+
+	request = gpiod_chip_request_lines(chip, NULL, line_cfg);
+
+free_line_cfg:
+	gpiod_line_config_free(line_cfg);
+
+free_settings:
+	gpiod_line_settings_free(settings);
+
+close_chip:
+	gpiod_chip_close(chip);
+
+	return request;
+}
+
+GPIOD_API struct gpiod_line_request *
+gpiod_ext_request_input(const char  *path, unsigned int offset)
+{
+	return ext_request(path, offset, GPIOD_LINE_DIRECTION_INPUT, 0);
+}
+
+GPIOD_API struct gpiod_line_request *
+gpiod_ext_request_output(const char  *path, unsigned int offset,
+			 enum gpiod_line_value value)
+{
+	return ext_request(path, offset, GPIOD_LINE_DIRECTION_OUTPUT, value);
+}
+
+static struct gpiod_line_settings *
+ext_line_settings(struct gpiod_line_request * olr)
+{
+	struct gpiod_line_settings *settings = NULL;
+	struct gpiod_line_info *line_info;
+	struct gpiod_chip *chip;
+	char path[32];
+
+	assert(olr);
+
+	if (olr->num_lines != 1) {
+		errno = EINVAL;
+		return NULL;
+	}
+
+	/*
+	 * This is all decidedly non-optimal, as generally the user has the
+	 * config available from when they made the request, but here we need to
+	 * rebuild it from the line info...
+	 */
+	memcpy(path, "/dev/", 5);
+	strncpy(&path[5], olr->chip_name, 26);
+	chip = gpiod_chip_open(path);
+	if (!chip)
+		return NULL;
+
+	// get info
+	line_info = gpiod_chip_get_line_info(chip, olr->offsets[0]);
+	gpiod_chip_close(chip);
+	if (!line_info)
+		return NULL;
+
+	if (gpiod_line_info_get_direction(line_info) != GPIOD_LINE_DIRECTION_INPUT) {
+		errno = EINVAL;
+		goto free_info;
+	}
+
+	settings = gpiod_line_settings_new();
+	if (!settings)
+		goto free_info;
+
+	gpiod_line_settings_set_direction(settings, GPIOD_LINE_DIRECTION_INPUT);
+	gpiod_line_settings_set_bias(settings,
+		gpiod_line_info_get_bias(line_info));
+	gpiod_line_settings_set_edge_detection(settings,
+		gpiod_line_info_get_edge_detection(line_info));
+	gpiod_line_settings_set_debounce_period_us(settings,
+		gpiod_line_info_get_debounce_period_us(line_info));
+
+free_info:
+	gpiod_line_info_free(line_info);
+
+	return settings;
+}
+
+static int
+ext_reconfigure(struct gpiod_line_request *request, struct gpiod_line_settings *settings)
+{
+	struct gpiod_line_config *line_cfg;
+	int ret;
+
+	line_cfg = gpiod_line_config_new();
+	if (!line_cfg)
+		return -1;
+
+	ret = gpiod_line_config_add_line_settings(line_cfg, request->offsets, 1,
+						  settings);
+	if (ret)
+		goto free_line_cfg;
+
+	ret = gpiod_line_request_reconfigure_lines(request, line_cfg);
+
+free_line_cfg:
+	gpiod_line_config_free(line_cfg);
+
+	return ret;
+}
+
+GPIOD_API int
+gpiod_ext_set_bias(struct gpiod_line_request * olr,
+		   enum gpiod_line_bias bias)
+{
+	int ret;
+
+	struct gpiod_line_settings *settings;
+
+	settings = ext_line_settings(olr);
+	if (!settings)
+		return -1;
+
+	ret = gpiod_line_settings_set_bias(settings, bias);
+	if (!ret)
+		ret = ext_reconfigure(olr, settings);
+
+	gpiod_line_settings_free(settings);
+
+	return ret;
+}
+
+GPIOD_API int
+gpiod_ext_set_debounce_period_us(struct gpiod_line_request * olr,
+				 unsigned long period)
+{
+	struct gpiod_line_settings *settings;
+	int ret;
+
+	settings = ext_line_settings(olr);
+	if (!settings)
+		return -1;
+
+	gpiod_line_settings_set_debounce_period_us(settings, period);
+	ret = ext_reconfigure(olr, settings);
+
+	gpiod_line_settings_free(settings);
+
+	return ret;
+}
+
+GPIOD_API int
+gpiod_ext_set_edge_detection(struct gpiod_line_request * olr,
+			     enum gpiod_line_edge edge)
+{
+	struct gpiod_line_settings *settings;
+	int ret;
+
+	settings = ext_line_settings(olr);
+	if (!settings)
+		return -1;
+
+	ret = gpiod_line_settings_set_edge_detection(settings, edge);
+	if (!ret)
+		ret = ext_reconfigure(olr, settings);
+
+	gpiod_line_settings_free(settings);
+
+	return ret;
+}


Oh, I also added this:

+/**
+ * @brief The size required to contain a single edge event.
+ * @return The size in bytes.
+ */
+size_t gpiod_edge_event_size();
+

So users can perform the event read themselves without requiring any
knowledge of event buffers (at the moment they can't determine the size
required to perform the read).

I also intend to provide an updated set of examples that use the ext API.
They should go in examples/ext?

Cheers,
Kent.


